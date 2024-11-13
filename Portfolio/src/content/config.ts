import { defineCollection, z } from "astro:content";

const projects = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.string(),
    languages: z.array(z.string()),
    repo: z.string().url(),
    live: z.string().url(),
    img: z.string(),
  })
})

export const collections = { projects };