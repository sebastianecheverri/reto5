class Game
  attr_reader :puntaje
  @@preguntas = IO.readlines("preguntas.txt")

  def initialize
      @puntaje = 0;
  end

  def question(i)
      @@preguntas[i].split("(Definicion)")[1]
  end

  def answer(respuestaJugador,i)
      respuestaReal = @@preguntas[i].split("(Respuesta)")[1].split(/\W/)[1]
      nota = (respuestaReal == respuestaJugador)
  end

  def total_score(nota)
      @puntaje +=1 if nota == true
  end

  def muestra_preguntas
    i = 0
    loop do
      break if Game.preguntas-1 <= i
      print question(i)
      print "Adivina: "
      respuesta = gets.chomp
      nota = answer(respuesta,i+1)
      total_score(nota)

      if nota
        puts "¡Correcto! Tu puntaje es #{puntaje}"
        i += 3
      else
        puts "¡Incorrecto! :( Trata de nuevo"
      end
    end
  end

  def jugar
    puts "\n\t¡¡Bienvenido a reto 5!!\n "
    puts "Para jugar, sólo ingresa la banda correcta para cada una de las canciones.\n\n¿Listo? ¡Vamos!\n "
    muestra_preguntas
  end

  def self.preguntas
      @@preguntas.size;
  end

end

jugador = Game.new
jugador.jugar