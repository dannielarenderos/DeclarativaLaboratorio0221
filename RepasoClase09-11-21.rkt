#lang racket

; EJERCICIO 

(define (bisiesto numero)
   (if (and ( = 0 (modulo numero 4))  (or  (not(= 0 (modulo numero 100))) ( = 0 (modulo numero 400)) ) )  
       (display "El año es bisiesto")
       (display "El año no es bisiesto")
   )
)

; EJERCICIO

(define (triangulo n1 n2 n3)
    (cond 
        ( (= n1 n2 n3 ) ( display "Equilatero" )  )
        ( ( or ( = n1 n2 ) ( = n1 n3 ) ( = n2 n3 ) ) ( display "Isósceles" )  )
        ( (not ( = n1 n2 n3 )) (display "Escaleno") )
     )
)


; EJERCICIO

(define (circunferencia radio)
     ( if ( < 0 radio)
          ( begin
             (let ([ are (* pi ( expt radio 2 ))]) (display are))
             
          )
          ( begin
             (display "Es un punto \n ")
             (let ([ x1 (read)]) (let ([ y1 (read)]) (display (sqrt ( + ( expt x1 2) (expt y1 2) )   )  ) ))
             
          )
          )
  )


; EJERCICIO 

(define (areade r n)
      (cond
           ( ( = 4 n ) (let ([ area4 (* 2 ( expt r 2 ))]) (display area4)))
           ( ( = 6 n ) (let ([ area6  ( * r 6 )]) (display area6)))     
          )

  )




; EJERCICIO 

(define (imprimirNPrincipal num)
   (imprimirN num 1)
 )

(define (imprimirN num cont)
   (if (<= cont num)
       (begin
           (imprimirNAux cont 1)
           (imprimirN num (+ cont 1))
        )
       (begin
           (display " ")
        )
    )
)

(define (imprimirNAux num c)
   (if (< c num)
       (begin
           (display " " )
           (imprimirNAux num (+ c 1))
        )
       (begin
           (display "A" )
           (display "\n")
        )
    )
)


; EJERCICIO 


(define (numeroPer n)
  (numeroPerAux n 1 0)
)


(define (numeroPerAux n c sum)
  (if (< c n)
     (begin
       (if (= ( modulo n c ) 0)
             (numeroPerAux n (+ c 1) (+ sum c))
             (numeroPerAux n (+ c 1) sum)
        )
     )
     (begin
          (if (= sum n)
              (display #t) 
              (display #f)
          )
      )
   )
)


