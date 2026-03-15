// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: "FOSS DJ PLAYER",
      logo: {
        light: "./src/assets/foss-djp-bn2@2x.png",
        dark: "./src/assets/foss-djp-bn1@2x.png",
        replacesTitle: true,
      },
      customCss: [
        // Relative path to your @font-face CSS file.
        "./src/fonts/font-face.css",
        "./src/styles/custom.css",
      ],
      social: [
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
            { label: "Example Guide", slug: "guides/example" },
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
