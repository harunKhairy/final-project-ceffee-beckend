const jwt = require("jsonwebtoken");

module.exports = {
  createJWTToken(payload) {
    return jwt.sign(payload, "kopikopiko", { expiresIn: "12h" });
  },
};
