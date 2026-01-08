export function toNumber(value) {
  if (typeof value === 'number') return Number.isFinite(value) ? value : 0;
  if (typeof value === 'string') {
    const n = Number.parseFloat(value);
    return Number.isFinite(n) ? n : 0;
  }
  return 0;
}

/**
 * Formats a number-like value into an INR amount string (without the ₹ symbol),
 * e.g. "12,345.67"
 */
export function formatINRAmount(value) {
  const n = toNumber(value);
  try {
    return new Intl.NumberFormat('en-IN', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    }).format(n);
  } catch {
    return n.toFixed(2);
  }
}


