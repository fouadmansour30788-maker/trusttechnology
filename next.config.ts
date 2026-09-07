import type { NextConfig } from "next";
import path from "path";

const nextConfig: NextConfig = {
  turbopack: {
    root: path.resolve(__dirname),
  },
  images: {
    // Allow admin-uploaded product images served from Supabase Storage.
    remotePatterns: [{ protocol: 'https', hostname: '*.supabase.co' }],
    // Vercel's on-the-fly image optimization quota is exhausted (returns 402
    // for any image not already cached), breaking most product thumbnails.
    // Serve images as-is instead of routing through /_next/image.
    unoptimized: true,
  },
};

export default nextConfig;
