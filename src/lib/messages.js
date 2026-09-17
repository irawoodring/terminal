const color = "\x1b[1;35m";
const underline = "\x1b[94;4m";
const normal = "\x1b[0m";
export const introMessage = [
  "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+",
  "| There is no spoon, and the cake is a lie.                                   |",
  "|                                                                             |",
  "| Search through the directories to get started.  Commands like ls, cd, and   |",
  "| cat will be helpful.                                                        |",
  "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+",
  ""
];
export const errorMessage = [
  color + "CheerpX could not start" + normal,
  "",
  "Check the DevTools console for more information",
  "",
  "CheerpX is expected to work with recent desktop versions of Chrome, Edge, Firefox and Safari",
  "",
  "Give it a try from a desktop version / another browser!",
  "",
  "CheerpX internal error message is:",
  "",
];
export const unexpectedErrorMessage = [
  color + "WebVM encountered an unexpected error" + normal,
  "",
  "Check the DevTools console for further information",
  "",
  "Please consider reporting a bug!",
  "",
  "CheerpX internal error message is:",
  "",
];
