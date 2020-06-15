const crypto = require("crypto");

module.exports = (password) => {
  return crypto
    .createHmac("sha256", "kopikopiko")
    .update(password)
    .digest("hex");
};
