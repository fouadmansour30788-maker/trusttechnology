'use client'
import { useState } from 'react'
import { motion, AnimatePresence, type Variants } from 'framer-motion'
import { ShoppingCart, Sparkles, ArrowRight, RotateCcw, Check } from 'lucide-react'
import { useCartStore } from '@/store/cart'
import {
  filterAndRankProducts,
  buildWhyExplanation,
  suggestAccessories,
  CATALOG,
  type UserProfile,
  type UserRole,
  type BusinessIndustry,
  type BusinessPainPoint,
  type StudentMajor,
  type StudentNeed,
  type AccessorySuggestion,
} from '@/lib/recommendation-engine'
import type { Product } from '@/lib/types'

// ─── Animation variants ────────────────────────────────────────────────────
const PAGE: Variants = {
  enter: { opacity: 0, x: 40, scale: 0.97 },
  center: { opacity: 1, x: 0, scale: 1 },
  exit: { opacity: 0, x: -40, scale: 0.97 },
}

const PAGE_TRANSITION = { duration: 0.35, ease: 'easeOut' as const }

// ─── Sub-components ────────────────────────────────────────────────────────
function OptionCard({
  label, emoji, description, selected, onClick,
}: { label: string; emoji: string; description?: string; selected: boolean; onClick: () => void }) {
  return (
    <motion.button
      whileHover={{ scale: 1.03 }}
      whileTap={{ scale: 0.97 }}
      onClick={onClick}
      className={`relative flex flex-col items-center text-center gap-3 p-6 rounded-2xl border-2 transition-colors cursor-pointer ${
        selected
          ? 'border-blue-500 bg-blue-600/15'
          : 'border-zinc-700 bg-zinc-900 hover:border-zinc-500'
      }`}
    >
      {selected && (
        <div className="absolute top-3 right-3 w-5 h-5 bg-blue-500 rounded-full flex items-center justify-center">
          <Check size={11} className="text-white" />
        </div>
      )}
      <span className="text-4xl">{emoji}</span>
      <div>
        <p className="text-white font-semibold">{label}</p>
        {description && <p className="text-zinc-500 text-xs mt-0.5">{description}</p>}
      </div>
    </motion.button>
  )
}

function StepHeader({ step, total, title, subtitle }: { step: number; total: number; title: string; subtitle: string }) {
  return (
    <div className="text-center mb-8">
      <div className="flex items-center justify-center gap-1.5 mb-4">
        {Array.from({ length: total }).map((_, i) => (
          <div
            key={i}
            className={`h-1 rounded-full transition-all duration-500 ${
              i < step ? 'w-8 bg-blue-500' : i === step ? 'w-8 bg-blue-400' : 'w-4 bg-zinc-700'
            }`}
          />
        ))}
      </div>
      <p className="text-blue-400 text-xs uppercase tracking-widest font-semibold mb-1">
        Step {step + 1} of {total}
      </p>
      <h2 className="text-2xl md:text-3xl font-bold text-white">{title}</h2>
      <p className="text-zinc-400 mt-2 text-sm">{subtitle}</p>
    </div>
  )
}

// ─── Main Wizard ────────────────────────────────────────────────────────────
export function RecommendationWizard() {
  const [step, setStep] = useState(0)
  const [profile, setProfile] = useState<Partial<UserProfile>>({ budget: 1500, accessories: [] })
  const [results, setResults] = useState<Product[]>([])
  const [suggestions, setSuggestions] = useState<AccessorySuggestion[]>([])
  const [loading, setLoading] = useState(false)
  const [loadingText, setLoadingText] = useState('')
  const addItem = useCartStore((s) => s.addItem)

  const TOTAL_STEPS = 4

  function next() { setStep((s) => s + 1) }

  function runRecommendation(finalProfile: UserProfile) {
    const texts = [
      'Analyzing your workflow…',
      'Scanning 124 products…',
      'Matching specs to your needs…',
      'Calculating best value…',
      'Almost there…',
    ]
    let i = 0
    setLoadingText(texts[0])
    setLoading(true)
    const interval = setInterval(() => {
      i++
      if (i < texts.length) setLoadingText(texts[i])
    }, 400)
    setTimeout(() => {
      clearInterval(interval)
      const matched = filterAndRankProducts(CATALOG, finalProfile)
      const accs = suggestAccessories(finalProfile)
      setResults(matched)
      setSuggestions(accs)
      setLoading(false)
      setStep(TOTAL_STEPS)
    }, 2200)
  }

  function reset() {
    setStep(0)
    setProfile({ budget: 1500, accessories: [] })
    setResults([])
    setSuggestions([])
    setLoading(false)
  }

  function addAllToCart() {
    results.forEach((p) => addItem(p, 1))
    profile.accessories?.forEach((accId) => {
      const acc = suggestions.find((a) => a.id === accId)
      if (!acc) return
      addItem(
        {
          id: acc.id, name: acc.name, slug: acc.id, description: null,
          price: acc.price, compare_at_price: null, primary_category_id: null,
          images: [], stock: 99, sku: acc.id, is_active: true, is_featured: false,
          specs: {}, created_at: '', updated_at: '', tags: [],
        },
        1
      )
    })
  }

  // ── Loading screen ────────────────────────────────────────────────────────
  if (loading) {
    return (
      <div className="min-h-[480px] flex flex-col items-center justify-center gap-8">
        <motion.div
          animate={{ rotate: 360 }}
          transition={{ duration: 2, repeat: Infinity, ease: 'linear' }}
          className="w-16 h-16 rounded-full border-2 border-blue-500/30 border-t-blue-500"
        />
        <div className="text-center space-y-2">
          <AnimatePresence mode="wait">
            <motion.p
              key={loadingText}
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -8 }}
              transition={{ duration: 0.3 }}
              className="text-white font-semibold text-lg"
            >
              {loadingText}
            </motion.p>
          </AnimatePresence>
          <p className="text-zinc-500 text-sm">Personalizing your recommendations</p>
        </div>
        <div className="flex gap-2">
          {[0, 1, 2].map((i) => (
            <motion.div
              key={i}
              className="w-2 h-2 rounded-full bg-blue-500"
              animate={{ opacity: [0.3, 1, 0.3] }}
              transition={{ duration: 1.2, repeat: Infinity, delay: i * 0.2 }}
            />
          ))}
        </div>
      </div>
    )
  }

  // ── Results screen ─────────────────────────────────────────────────────────
  if (step === TOTAL_STEPS) {
    return (
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="space-y-8">
        {/* Header */}
        <div className="text-center">
          <motion.div
            initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: 'spring', delay: 0.1 }}
            className="w-14 h-14 bg-blue-600/20 border border-blue-500/30 rounded-2xl flex items-center justify-center mx-auto mb-4"
          >
            <Sparkles className="text-blue-400" size={24} />
          </motion.div>
          <h2 className="text-2xl font-bold text-white">Your Recommendations</h2>
          <p className="text-zinc-400 mt-1 text-sm">
            {results.length > 0
              ? `We found ${results.length} products perfectly matched to your profile.`
              : 'No exact matches found — try increasing your budget or adjusting your preferences.'}
          </p>
        </div>

        {/* Product cards */}
        {results.length > 0 && (
          <div className="grid sm:grid-cols-2 gap-4">
            {results.map((product, i) => (
              <motion.div
                key={product.id}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: i * 0.1 }}
                className="bg-zinc-900 border border-zinc-800 rounded-2xl p-5 space-y-4"
              >
                {/* Product image placeholder */}
                <div className="w-full h-32 bg-zinc-800 rounded-xl flex items-center justify-center">
                  <span className="text-4xl">💻</span>
                </div>

                <div>
                  <p className="text-white font-semibold leading-snug">{product.name}</p>
                  <p className="text-zinc-400 text-xs mt-1 leading-relaxed line-clamp-2">{product.description}</p>
                </div>

                {/* "Why this?" bubble */}
                <div className="bg-blue-600/10 border border-blue-700/30 rounded-xl p-3">
                  <p className="text-blue-300 text-xs leading-relaxed">
                    <span className="font-semibold">Why this? </span>
                    {buildWhyExplanation(product, profile as UserProfile)}
                  </p>
                </div>

                {/* Specs preview */}
                {Object.keys(product.specs).length > 0 && (
                  <div className="grid grid-cols-2 gap-1.5">
                    {Object.entries(product.specs).slice(0, 4).map(([k, v]) => (
                      <div key={k} className="bg-zinc-800 rounded-lg px-2.5 py-1.5">
                        <p className="text-zinc-500 text-xs">{k}</p>
                        <p className="text-white text-xs font-medium truncate">{v}</p>
                      </div>
                    ))}
                  </div>
                )}

                <div className="flex items-center justify-between">
                  <div>
                    <span className="text-white font-bold text-lg">${product.price.toLocaleString()}</span>
                    {product.compare_at_price && (
                      <span className="text-zinc-500 line-through text-sm ml-2">${product.compare_at_price.toLocaleString()}</span>
                    )}
                  </div>
                  <button
                    onClick={() => addItem(product)}
                    className="flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium px-3 py-2 rounded-xl transition-colors"
                  >
                    <ShoppingCart size={14} /> Add
                  </button>
                </div>
              </motion.div>
            ))}
          </div>
        )}

        {/* Accessories */}
        {suggestions.length > 0 && profile.accessories && profile.accessories.length > 0 && (
          <div>
            <p className="text-sm font-semibold text-white mb-3">Your selected accessories</p>
            <div className="flex flex-wrap gap-2">
              {suggestions.filter((a) => profile.accessories?.includes(a.id)).map((acc) => (
                <div key={acc.id} className="flex items-center gap-2 bg-zinc-900 border border-zinc-700 rounded-xl px-3 py-2 text-sm">
                  <span>{acc.emoji}</span>
                  <span className="text-zinc-300">{acc.name}</span>
                  <span className="text-zinc-500">${acc.price}</span>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* CTAs */}
        {results.length > 0 && (
          <div className="flex flex-col sm:flex-row gap-3">
            <button
              onClick={addAllToCart}
              className="flex-1 flex items-center justify-center gap-2 bg-white text-black font-bold py-3.5 rounded-2xl hover:bg-zinc-100 transition-colors"
            >
              <ShoppingCart size={18} />
              Add All to Cart
            </button>
            <button
              onClick={reset}
              className="flex items-center justify-center gap-2 px-6 py-3.5 border border-zinc-700 text-zinc-400 hover:text-white hover:border-zinc-500 rounded-2xl transition-colors"
            >
              <RotateCcw size={16} /> Start Over
            </button>
          </div>
        )}
        {results.length === 0 && (
          <button
            onClick={reset}
            className="w-full flex items-center justify-center gap-2 py-3.5 border border-zinc-700 text-zinc-400 hover:text-white rounded-2xl transition-colors"
          >
            <RotateCcw size={16} /> Try Again
          </button>
        )}
      </motion.div>
    )
  }

  return (
    <div className="min-h-[480px]">
      <AnimatePresence mode="wait">
        {/* ── Step 0: Role ────────────────────────────────────────────────── */}
        {step === 0 && (
          <motion.div key="step0" variants={PAGE} initial="enter" animate="center" exit="exit" transition={PAGE_TRANSITION}>
            <StepHeader step={0} total={TOTAL_STEPS} title="Who are you shopping for?" subtitle="We'll tailor our recommendations to your needs." />
            <div className="grid grid-cols-2 gap-4 max-w-sm mx-auto">
              {([['business', '💼', 'Business', 'POS, productivity & office tools'], ['student', '🎓', 'Student', 'Study, design, coding & more']] as const).map(
                ([role, emoji, label, desc]) => (
                  <OptionCard
                    key={role}
                    emoji={emoji}
                    label={label}
                    description={desc}
                    selected={profile.role === role}
                    onClick={() => setProfile((p) => ({ ...p, role: role as UserRole }))}
                  />
                )
              )}
            </div>
            <div className="flex justify-center mt-8">
              <button
                disabled={!profile.role}
                onClick={next}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed text-white font-semibold px-8 py-3 rounded-2xl transition-colors"
              >
                Continue <ArrowRight size={16} />
              </button>
            </div>
          </motion.div>
        )}

        {/* ── Step 1: Context ──────────────────────────────────────────────── */}
        {step === 1 && profile.role === 'business' && (
          <motion.div key="step1-biz" variants={PAGE} initial="enter" animate="center" exit="exit" transition={PAGE_TRANSITION} className="space-y-8">
            <StepHeader step={1} total={TOTAL_STEPS} title="Tell us about your business" subtitle="We'll find the right tools for your industry." />
            <div>
              <p className="text-sm font-semibold text-zinc-400 mb-3 text-center">Industry</p>
              <div className="grid grid-cols-3 gap-3">
                {([['retail', '🏪', 'Retail', 'POS & inventory'], ['office', '🏢', 'Office', 'Productivity tools'], ['tech', '💻', 'Tech', 'Development & IT']] as const).map(
                  ([val, emoji, label, desc]) => (
                    <OptionCard key={val} emoji={emoji} label={label} description={desc}
                      selected={profile.industry === val}
                      onClick={() => setProfile((p) => ({ ...p, industry: val as BusinessIndustry }))} />
                  )
                )}
              </div>
            </div>
            <div>
              <p className="text-sm font-semibold text-zinc-400 mb-3 text-center">Primary Pain Point</p>
              <div className="grid grid-cols-3 gap-3">
                {([['speed', '⚡', 'Speed', 'Fast performance'], ['portability', '🎒', 'Portability', 'Lightweight travel'], ['pos', '🖥️', 'POS Setup', 'Full POS system']] as const).map(
                  ([val, emoji, label, desc]) => (
                    <OptionCard key={val} emoji={emoji} label={label} description={desc}
                      selected={profile.pain_point === val}
                      onClick={() => setProfile((p) => ({ ...p, pain_point: val as BusinessPainPoint }))} />
                  )
                )}
              </div>
            </div>
            <div className="flex justify-center">
              <button disabled={!profile.industry || !profile.pain_point} onClick={next}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed text-white font-semibold px-8 py-3 rounded-2xl transition-colors">
                Continue <ArrowRight size={16} />
              </button>
            </div>
          </motion.div>
        )}

        {step === 1 && profile.role === 'student' && (
          <motion.div key="step1-stu" variants={PAGE} initial="enter" animate="center" exit="exit" transition={PAGE_TRANSITION} className="space-y-8">
            <StepHeader step={1} total={TOTAL_STEPS} title="What are you studying?" subtitle="We'll match specs to your coursework." />
            <div>
              <p className="text-sm font-semibold text-zinc-400 mb-3 text-center">Major</p>
              <div className="grid grid-cols-3 gap-3">
                {([
                  ['engineering', '⚙️', 'Engineering', 'CAD, simulations'],
                  ['architecture', '🏛️', 'Architecture', '3D rendering & BIM'],
                  ['arts', '🎨', 'Arts & Design', 'Creative tools'],
                  ['cs', '👨‍💻', 'Comp. Science', 'Coding & dev'],
                  ['business', '📊', 'Business', 'Office & finance'],
                ] as const).map(([val, emoji, label, desc]) => (
                  <OptionCard key={val} emoji={emoji} label={label} description={desc}
                    selected={profile.major === val}
                    onClick={() => setProfile((p) => ({ ...p, major: val as StudentMajor }))} />
                ))}
              </div>
            </div>
            <div className="flex justify-center">
              <button disabled={!profile.major} onClick={next}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed text-white font-semibold px-8 py-3 rounded-2xl transition-colors">
                Continue <ArrowRight size={16} />
              </button>
            </div>
          </motion.div>
        )}

        {/* ── Step 2: Specific needs (student only) ────────────────────────── */}
        {step === 2 && profile.role === 'student' && (
          <motion.div key="step2-stu" variants={PAGE} initial="enter" animate="center" exit="exit" transition={PAGE_TRANSITION} className="space-y-8">
            <StepHeader step={2} total={TOTAL_STEPS} title="What matters most to you?" subtitle="Select all that apply." />
            <div className="grid grid-cols-2 gap-3">
              {([
                ['rendering', '🎮', '3D Rendering', 'Dedicated GPU essential'],
                ['coding', '⚡', 'Fast Coding', 'High CPU performance'],
                ['battery', '🔋', 'Long Battery', 'All-day unplugged'],
                ['design', '🖼️', 'Design Tools', 'Color-accurate display'],
              ] as const).map(([val, emoji, label, desc]) => {
                const selected = profile.needs?.includes(val as StudentNeed) ?? false
                return (
                  <OptionCard key={val} emoji={emoji} label={label} description={desc} selected={selected}
                    onClick={() => {
                      const current = profile.needs ?? []
                      setProfile((p) => ({
                        ...p,
                        needs: selected ? current.filter((n) => n !== val) : [...current, val as StudentNeed],
                      }))
                    }} />
                )
              })}
            </div>
            <div className="flex justify-center">
              <button onClick={next}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-8 py-3 rounded-2xl transition-colors">
                Continue <ArrowRight size={16} />
              </button>
            </div>
          </motion.div>
        )}

        {/* ── Step 2 (business) / Step 3 (student): Budget & Accessories ───── */}
        {((step === 2 && profile.role === 'business') || (step === 3 && profile.role === 'student')) && (
          <motion.div key="step-budget" variants={PAGE} initial="enter" animate="center" exit="exit" transition={PAGE_TRANSITION} className="space-y-8">
            <StepHeader step={step} total={TOTAL_STEPS} title="Budget & Accessories" subtitle="Set your budget and pick any extras you need." />

            {/* Budget slider */}
            <div className="space-y-3">
              <div className="flex justify-between items-center">
                <p className="text-sm font-semibold text-white">Budget</p>
                <span className="text-blue-400 font-bold text-lg">${(profile.budget ?? 1500).toLocaleString()}</span>
              </div>
              <input
                type="range" min={400} max={3000} step={100}
                value={profile.budget ?? 1500}
                onChange={(e) => setProfile((p) => ({ ...p, budget: Number(e.target.value) }))}
                className="w-full h-2 bg-zinc-700 rounded-full appearance-none cursor-pointer accent-blue-500"
              />
              <div className="flex justify-between text-xs text-zinc-600">
                <span>$400</span><span>$1,000</span><span>$2,000</span><span>$3,000</span>
              </div>
            </div>

            {/* Accessories */}
            {(() => {
              const accs = suggestAccessories({
                ...profile,
                role: profile.role!,
                budget: profile.budget ?? 1500,
                accessories: profile.accessories ?? [],
              } as UserProfile)
              return accs.length > 0 ? (
                <div className="space-y-3">
                  <p className="text-sm font-semibold text-white">Add accessories?</p>
                  <div className="grid grid-cols-2 gap-2">
                    {accs.map((acc) => {
                      const selected = profile.accessories?.includes(acc.id) ?? false
                      return (
                        <button key={acc.id} onClick={() => {
                          const current = profile.accessories ?? []
                          setProfile((p) => ({
                            ...p,
                            accessories: selected ? current.filter((a) => a !== acc.id) : [...current, acc.id],
                          }))
                        }}
                          className={`flex items-center gap-3 p-3 rounded-xl border text-left transition-colors ${selected ? 'border-blue-500 bg-blue-600/15' : 'border-zinc-700 bg-zinc-900 hover:border-zinc-600'}`}>
                          {selected && <Check size={12} className="text-blue-400 shrink-0" />}
                          <span>{acc.emoji}</span>
                          <div className="min-w-0">
                            <p className="text-white text-xs font-medium">{acc.name}</p>
                            <p className="text-zinc-500 text-xs">+${acc.price}</p>
                          </div>
                        </button>
                      )
                    })}
                  </div>
                </div>
              ) : null
            })()}

            <div className="flex justify-center">
              <button
                onClick={() => runRecommendation({ ...profile, role: profile.role!, budget: profile.budget ?? 1500, accessories: profile.accessories ?? [] } as UserProfile)}
                className="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-bold px-10 py-3.5 rounded-2xl transition-colors text-base"
              >
                <Sparkles size={18} /> Find My Products
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  )
}
