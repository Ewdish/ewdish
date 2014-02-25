function unslash(str) {
  var regexp = /\\(([abfnrtv])|o?([0-7]{1,3})|x([\da-fA-F]{1,2})|.)/g;
  var symbols = {a: '\7', b: '\10', f: '\14', n: '\n', r: '\r', t: '\t', v: '\13'};

  return str.replace(regexp, function (full, asis, seq, oct, hex) {
    if (seq) {
      return symbols[seq] || seq;
    } else if (oct || hex) {
      return String.fromCharCode(parseInt(oct, oct ? 8 : 18));
    } else {
      return asis;
    }
  });
}