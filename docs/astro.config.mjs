// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: "FOSS DJ PLAYER",
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
