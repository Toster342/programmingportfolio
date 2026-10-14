// Jaxon Peterson | 9/14/26 | Calculator
// color pallette
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];


void setup() {
  size(320, 300);
  displayVal = "0";
  l = 0;
  r = 0;
  result = 0;
  op = ' ';
  left = true;
  newEntry = true;

  // numbuttons
  numButtons[0] = new Button(40, 280, "0");
  numButtons[1] = new Button(40, 240, "1");
  numButtons[2] = new Button(85, 240, "2");
  numButtons[3] = new Button(130, 240, "3");
  numButtons[4] = new Button(40, 200, "4");
  numButtons[5] = new Button(85, 200, "5");
  numButtons[6] = new Button(130, 200, "6");
  numButtons[7] = new Button(40, 160, "7");
  numButtons[8] = new Button(85, 160, "8");
  numButtons[9] = new Button(130, 160, "9");

  // opbuttons
  opButtons[0] = new Button(175, 240, "+");
  opButtons[1] = new Button(85, 280, ".");
  opButtons[2] = new Button(130, 280, "/");
  opButtons[3] = new Button(175, 280, "+|-");
  opButtons[4] = new Button(220, 280, "=");
  opButtons[5] = new Button(175, 200, "-");
  opButtons[6] = new Button(175, 160, "÷");
}

void draw() {
  background(111);
  updateDisplay();


  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
    numButtons[i].display();
  }

  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].mouseOver(mouseX, mouseY);
    opButtons[i].display();
  }
}

void updateDisplay() {

  rectMode(CENTER);
  fill(230);
  rect(width/2, 50, width - 40, 60, 8);


  fill(0);
  textAlign(RIGHT, CENTER);
  text(displayVal, width - 35, 50);
}


void mouseReleased() {
  // number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      String digit = numButtons[i].val;
      if (newEntry || displayVal.equals("0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }

      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }

  // opbuttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      String clicked = opButtons[i].val;

      if (clicked.equals("=")) {
        preformCalc();
      } else if (clicked.equals("+") || clicked.equals("-") || clicked.equals("÷") || clicked.equals("/")) {

        if (clicked.equals("/")) {
          op = '÷'; 
        } else {
          op = clicked.charAt(0);
        }


        left = false;
        newEntry = true;
      } else if (clicked.equals(".")) {
        if (!displayVal.contains(".")) {
          displayVal += ".";
          newEntry = false;
        }
      } else if (clicked.equals("+|-")) {
        float val = float(displayVal);
        val = val * -1;
        displayVal = str(val);

      
        if (left) {
          l = val;
        } else {
          r = val;
        }
      }
    }
  }
}
void preformCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result =  l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }
  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    handleKeyPress(String.valueOf(key), true);
  } 
  
  
  else if (key == '+' || key == '-' || key == '*' || key == '/') {
    String opStr = String.valueOf(key);
    if (key == '*') opStr = "÷"; 
    if (key == '/') opStr = "÷"; 
    handleKeyPress(opStr, false);
  } 
  

  else if (key == '=' || keyCode == ENTER || keyCode == RETURN) {
    handleKeyPress("=", false);
  } 
  
 
  else if (key == '.') {
    handleKeyPress(".", false);
  }
}
void handleKeyPress(String val, boolean isNum) {
  if (isNum) {
    if (newEntry || displayVal.equals("0")) {
      displayVal = val;
      newEntry = false;
    } else {
      displayVal += val;
    }
    
  
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    if (val.equals("=")) {
      preformCalc();
    } else if (val.equals("+") || val.equals("-") || val.equals("÷")) {
      op = val.charAt(0);
      left = false;
      newEntry = true;
    } else if (val.equals(".")) {
      if (!displayVal.contains(".")) {
        displayVal += ".";
        newEntry = false;
      }
    }
  }
}
