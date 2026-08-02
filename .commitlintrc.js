module.exports = {
  rules: {
    // Header - type(scope): subject
    "header-max-length": [2, "always", 100],

    // Type
    "type-case": [1, "always", "lower-case"],
    "type-enum": [
      2,
      "always",
      [
        "build",
        "chore",
        "ci",
        "docs",
        "feat",
        "fix",
        "perf",
        "refactor",
        "revert",
        "style",
        "test",
      ],
    ],

    // Scope
    "scope-empty": [0, "never"],

    // Subject
    "subject-case": [
      2,
      "never",
      ["pascal-case", "sentence-case", "start-case", "upper-case"],
    ],
    "subject-empty": [2, "never"],
    "subject-full-stop": [1, "never", "."],

    // Body
    "body-leading-blank": [2, "always"],
    "body-max-line-length": [2, "always", 100],

    // Footer
    "footer-leading-blank": [2, "always"],
    "footer-max-line-length": [2, "always", 100],
  },
};
