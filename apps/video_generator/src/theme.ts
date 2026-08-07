import { loadFont as loadOutfit } from "@remotion/google-fonts/Outfit";
import { loadFont as loadNotoSerif } from "@remotion/google-fonts/NotoSerif";
import { loadFont as loadBangers } from "@remotion/google-fonts/Bangers";

// Load Google Fonts
export const { fontFamily: outfitFont } = loadOutfit();
export const { fontFamily: serifFont } = loadNotoSerif();
export const { fontFamily: animeFont } = loadBangers();

export const AppColors = {
  // Gen-Z Brand Colors by Subject
  physicsChem: "#EC8366", // Terracotta
  biology: "#F26A6C", // Crimson/Pink
  maths: "#06B6D4", // Electric Cyan
  
  // Backgrounds
  obsidian: "#0F172A",
  obsidianDark: "#020617",
  
  // Base Colors
  white: "#FFFFFF",
  grayText: "#94A3B8"
};
