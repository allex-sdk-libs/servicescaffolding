function isOfType(types, t) {
  if (!types) {
    return false;
  }
  if ('object' === typeof types && types instanceof Array) {
    throw Error('Multiple type options are not allowed');
    return types.indexOf(t) >= 0;
  }
  return types === t;
}

module.exports = isOfType;
