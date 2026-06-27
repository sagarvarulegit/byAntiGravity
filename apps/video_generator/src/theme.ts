import { loadFont as loadOutfit } from "@remotion/google-fonts/Outfit";
import { loadFont as loadNotoSerif } from "@remotion/google-fonts/NotoSerif";

// Load Google Fonts
export const { fontFamily: outfitFont } = loadOutfit();
export const { fontFamily: serifFont } = loadNotoSerif();

export const AppColors = {
  purple: '#BE185D',
  purpleLight: '#FCE7F3',
  purpleDark: '#831843',

  orange: '#EA580C',
  orangeLight: '#FFEDD5',
  orangeDark: '#7C2D12',

  green: '#10B981',
  greenLight: '#ECFDF5',
  greenDark: '#064E3B',

  blue: '#0284C7',
  blueLight: '#E0F2FE',
  blueDark: '#0C4A6E',

  bgLight: '#FAF9F6',
  bgDark: '#0F172A',

  cardLight: '#FFFFFF',
  cardDark: '#1E293B',

  borderLight: '#E2E8F0',
  borderDark: '#334155',

  textLightPrimary: '#0F172A',
  textLightSecondary: '#334155',
  textDarkPrimary: '#F8FAFC',
  textDarkSecondary: '#CBD5E1',
};
