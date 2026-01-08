// Utility function to safely parse JSON strings
export const parseJsonSafely = (value, defaultValue = null) => {
  if (!value) return defaultValue;
  
  // If already parsed (array or object), return as is
  if (Array.isArray(value) || (typeof value === 'object' && value !== null)) {
    return value;
  }
  
  // If it's a string, try to parse it
  if (typeof value === 'string') {
    try {
      return JSON.parse(value);
    } catch (error) {
      console.error('Error parsing JSON:', error, value);
      // If it's a single URL string, return as array
      if (value.startsWith('http')) {
        return [value];
      }
      return defaultValue;
    }
  }
  
  return defaultValue;
};

// Specific function for image URLs
export const parseImageUrls = (imageUrls) => {
  const parsed = parseJsonSafely(imageUrls, []);
  return Array.isArray(parsed) ? parsed : [parsed].filter(Boolean);
};

// Specific function for specifications
export const parseSpecifications = (specifications) => {
  return parseJsonSafely(specifications, {});
};

