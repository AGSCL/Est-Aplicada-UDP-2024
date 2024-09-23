- Class: "text"
Output: "¡Bienvenido a la lección sobre matrices en R! Vamos a aprender cómo crear y manipular matrices. Empecemos con lo básico."

- Class: "cmd_question"
Output: "Crea una matriz de 3 filas y 3 columnas que contenga los números del 1 al 9."
CorrectAnswer: "matrix(1:9, nrow=3, ncol=3)"
AnswerTests: "omnitest(correctVal='matrix(1:9, nrow=3, ncol=3)')"
Hint: "Usa la función matrix(), nrow para el número de filas y ncol para columnas."

- Class: "text"
Output: "¡Perfecto! Ahora que has creado tu primera matriz, vamos a realizar algunas operaciones con ella."

- Class: "cmd_question"
Output: "Suma 2 a cada elemento de la matriz. Usa la operación A + 2."
CorrectAnswer: "A <- matrix(1:9, nrow=3, ncol=3)\nA + 2"
AnswerTests: "omnitest(correctVal='matrix(c(3,4,5,6,7,8,9,10,11), nrow=3, ncol=3)')"
Hint: "Recuerda que puedes hacer operaciones directamente en la matriz."

- Class: "text"
Output: "¡Bien hecho! Ahora intentemos multiplicar dos matrices."

- Class: "cmd_question"
Output: "Crea una nueva matriz B con los números del 9 al 1 y multiplícala por A usando el operador %*%."
CorrectAnswer: "B <- matrix(9:1, nrow=3, ncol=3)\nA %*% B"
AnswerTests: "omnitest(correctVal='matrix(c(30, 24, 18, 84, 69, 54, 138, 114, 90), nrow=3, ncol=3)')"
Hint: "El operador de multiplicación de matrices es %*%."

- Class: "text"
Output: "¡Felicidades! Has aprendido lo básico sobre la creación y manipulación de matrices en R."
