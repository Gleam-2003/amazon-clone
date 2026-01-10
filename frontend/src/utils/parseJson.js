export const parseJsonSafely = (value, defaultValue = null) => {
  if (!value) return defaultValue;
  
  if (Array.isArray(value) || (typeof value === 'object' && value !== null)) {
    return value;
  }
  
  if (typeof value === 'string') {
    try {
      return JSON.parse(value);
    } catch (error) {
      console.error('Error parsing JSON:', error, value);
      if (value.startsWith('http')) {
        return [value];
      }
      return defaultValue;
    }
  }
  
  return defaultValue;
};

export const parseImageUrls = (imageUrls) => {
  const parsed = parseJsonSafely(imageUrls, []);
  return Array.isArray(parsed) ? parsed : [parsed].filter(Boolean);
};

export const parseSpecifications = (specifications) => {
  return parseJsonSafely(specifications, {});
};

