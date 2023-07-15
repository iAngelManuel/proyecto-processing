// VARIABLES DE IMAGEN
PImage[] images = new PImage[11];
PImage[] option3Images = new PImage[4];
PImage[] option3_3Images = new PImage[8];
PImage imgGoBack;
PImage imgGo;

// VARIABLES DE TEXTO
String[] texts = new String[11];
String[] option3Texts = new String[4];
String[] option3_3Texts = new String[8];

// VARIABLES DE TAMAÑO DE TEXTO
float[] textPositionsX = new float[11];
float[] textPositionsY = new float[11];
float[] option3TextPositionsX = new float[4];
float[] option3TextPositionsY = new float[4];
float[] option3_3TextPositionsX = new float[8];
float[] option3_3TextPositionsY = new float[8];

// VARIABLES DE BOTONES
boolean goBack = false;
boolean go = false;

// OTROS
boolean[] diapos = new boolean[12];
boolean[] option3Diapos = new boolean[4];
boolean[] option3_3Diapos = new boolean[8];
boolean[] option3_3_ImagesDiapos = new boolean[8];
float tiempoDiapositiva = 0;
float duracionDiapositiva = 5;

public void settings() {
  size(640, 480);
}

public void setup() {
  // INICIALIZACIÓN DE VARIABLES RAMA 0
  for (int i = 0; i < 11; i++) {
    images[i] = loadImage("rama0/imagenes/p" + (i+1) + ".jpg");
    textPositionsX[i] = width / 2;
    textPositionsY[i] = height / 2;
    texts[i] = "Hola" + (i+1);
  }

  // INICIALIZACIÓN DE VARIABLES RAMA 1
  for (int i = 0; i < 4; i++) {
    option3Images[i] = loadImage("rama1/imagenes/p" + (i+3) + "r1.jpg");
    option3TextPositionsX[i] = width / 2;
    option3TextPositionsY[i] = height / 2;
    option3Texts[i] = "Hola3." + (i+1);
  }

  // INICIALIZACIÓN DE VARIABLES RAMA 2
  for (int i = 0; i < 8; i++) {
    option3_3Images[i] = loadImage("rama2/imagenes/p" + (i+5) + "r3.jpeg");
    option3_3TextPositionsX[i] = width / 2;
    option3_3TextPositionsY[i] = height / 2;
    option3_3Texts[i] = "Hola3.3." + (i+1);
  }

  // INICIALIZACIÓN DE VARIABLES DE INICIO
  imgGoBack = loadImage("volver.jpg");
  imgGo = loadImage("go.png");
}

public void draw() {
  // println("La posición actual del mouse es: (" + mouseX + ", " + mouseY + ")");

  if (!go) {
    background(255, 255, 255);
    image(imgGo, 241, 190, 150, 150);
  } else {
    for (int i = 0; i < 12; i++) {
      if (diapos[i]) {
        image(images[i], 0, 0, 640, 480);
        fill(0);
        textSize(50);
        text(texts[i], textPositionsX[i], textPositionsY[i]);
        if (i == 0 || i == 1 || i == 3 || i == 4 || i == 5 || i == 6 || i == 7 || i == 8 || i == 9 || i == 10) {
          drawNextButton();
        } else if (i == 2) {
          drawOptionalButton();
        } else if (i == 11) {
          image(imgGoBack, 575, 380, 50, 85);
        }
      }
    }
    
    for (int i = 0; i < 4; i++) {
      if (option3Diapos[i]) {
        image(option3Images[i], 0, 0, 640, 480);
        fill(0);
        textSize(50);
        text(option3Texts[i], option3TextPositionsX[i], option3TextPositionsY[i]);
        if (i == 0 || i == 1) {
          drawNextButton();
        } else if (i == 2) {
          drawOptionalButton();
        } else if (i == 3) {
          image(imgGoBack, 575, 380, 50, 85);
        }
      }
    }

    for (int i = 0; i < 8; i++) {
      if (option3_3Diapos[i]) {
        image(option3_3Images[i], 0, 0, 640, 480);
        fill(0);
        textSize(50);
        text(option3_3Texts[i], option3_3TextPositionsX[i], option3_3TextPositionsY[i]);
        if (option3_3_ImagesDiapos[i]) {
          drawNextButton();
        } else {
          drawOptionalButton();
        }
      }
    }
  }
}

public void mouseClicked() {
  if (!go) {
    if (mouseX >= 241 && mouseX <= 391 && mouseY >= 190 && mouseY <= 340) {
      go = true;
      diapos[0] = true;
    }
  } else {
    for (int i = 0; i < 12; i++) {
      if (diapos[i] && i != 1 && i != 11) {
        if (mouseX >= 575 && mouseX <= 625 && mouseY >= 380 && mouseY <= 465) {
          goBack = true;
          diapos[i] = false;
          diapos[0] = true;
        } else {
          diapos[i] = false;
          if (i < 11) {
            diapos[i+1] = true;
          }
        }
      }
    }
    
    for (int i = 0; i < 4; i++) {
      if (option3Diapos[i] && i != 2 && i != 3) {
        if (mouseX >= 575 && mouseX <= 625 && mouseY >= 380 && mouseY <= 465) {
          goBack = true;
          option3Diapos[i] = false;
          diapos[2] = true;
        } else {
          option3Diapos[i] = false;
          if (i < 3) {
            option3Diapos[i+1] = true;
          }
        }
      }
    }

    for (int i = 0; i < 8; i++) {
      if (option3_3Diapos[i]) {
        if (option3_3_ImagesDiapos[i]) {
          option3_3_ImagesDiapos[i] = false;
          if (i < 7) {
            option3_3_ImagesDiapos[i+1] = true;
          }
        } else {
          option3_3Diapos[i] = false;
          option3_3_ImagesDiapos[i] = true;
        }
      }
    }
  }
}

void drawNextButton() {
  // Estilos del botón
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  fill(0);
  
  // Dimensiones del botón
  float buttonWidth = 120;
  float buttonHeight = 40;
  
  // Posición del botón (parte inferior centrada)
  float buttonX = width / 2;
  float buttonY = height - buttonHeight / 2 - 20; // 20 es el espacio desde el borde inferior
  
  // Dibujar el botón de avanzar diapositiva
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  textSize(18);
  fill(255);
  text("Avanzar", buttonX, buttonY);
}

void drawOptionalButton() {
  // Obtener las dimensiones de los botones
  int buttonWidth = 100;
  int buttonHeight = 40;
  
  // Calcular las coordenadas para centrar los botones en la parte inferior
  int buttonX1 = width/2 - buttonWidth/2 - 80; // Coordenada X del botón 1
  int buttonX2 = width/2 - buttonWidth/2 + 80; // Coordenada X del botón 2
  int buttonY = height - 50; // Coordenada Y de ambos botones
  
  // Dibujar el botón de Opción 1
  fill(255);
  stroke(0);
  rect(buttonX1, buttonY, buttonWidth, buttonHeight);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Opción 1", buttonX1, buttonY, buttonWidth, buttonHeight);
  
  // Dibujar el botón de Opción 2
  fill(255);
  stroke(0);
  rect(buttonX2, buttonY, buttonWidth, buttonHeight);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Opción 2", buttonX2, buttonY, buttonWidth, buttonHeight);
}
