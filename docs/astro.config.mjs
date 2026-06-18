// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  // Define the deploy URL of the documentation website.
  site: "https://docs.foss-dj-player.org",
  integrations: [
    starlight({
      // Use the route data middleware to add the Open Graph images.
      routeMiddleware: "./src/routeData.ts",
      title: "FOSS DJ PLAYER",
      logo: {
        light: "./src/assets/fdjp_light_2xl.png",
        dark: "./src/assets/fdjp_dark_2xl.png",
        replacesTitle: true,
      },
      customCss: [
        // Relative path to your @font-face CSS file.
        "./src/fonts/font-face.css",
        "./src/styles/custom.css",
      ],
      social: [
        {
          icon: "discord",
          label: "Discord",
          href: "https://discord.gg/WABteAtQdq",
        },
        {
          icon: "github",
          label: "GitHub",
          href: "https://github.com/fibonacid/foss-dj-player",
        },
      ],

      sidebar: [
        {
          label: "Introduction",
          link: "/intro",
        },
        {
          label: "Guides",
          items: [
            // Each item here is one entry in the navigation menu.
            { label: "RPI Setup", slug: "guides/rpi-setup" },
          ],
        },
        // {
        //   label: "Reference",
        //   autogenerate: { directory: "reference" },
        // },
      ],
    }),
  ],
});
