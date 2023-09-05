/** @type {import('next').NextConfig} */
const nextConfig = {
  async rewrites() {
    return [
      {
        source: "/:number",
        destination: "/api/:number",
      },
    ];
  },
};

module.exports = nextConfig;
