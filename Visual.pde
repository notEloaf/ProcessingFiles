Perceptron brain;
Point[] points = new Point[1000];

boolean working = true;
long timeNeeded = 0;
float LINEDASH = 0;
long startTime = 0;
int trainingIndex = 0;
void setup(){
  size(800,800, P2D);
  brain = new Perceptron(3);
  startTime = System.nanoTime();
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
}

void draw(){
  background(255);
  stroke(0);
  float prevLine = LINEDASH;
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  LINEDASH = (-(p4.pixelY()-p3.pixelY())/(p4.pixelX()-p3.pixelX()));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(),p4.pixelY()); 
  //SHOWS EQUATION OF CURRENT LINE
  for(Point pt : points){
    pt.show();
  }
  for(Point pt : points){
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    brain.train(inputs, pt.label);
    int guess = brain.guess(inputs);
    if(guess == target){
      fill(0, 255, 0);
    }else{
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 6, 6);
  }
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if(trainingIndex == points.length){
   trainingIndex = 0;
  }
  fill(0);
  text("Expected Eqaution: " + "0.5 * x + 0.2", 5,10);
  text("Real Eqaution: "+(-(p4.pixelY()-p3.pixelY())/(p4.pixelX()-p3.pixelX())) + " x", 5,25);
  if(!working){
    fill(255, 0, 0);  
  }
  text("Time: " + (timeNeeded / pow(10, 9)), 700, 10);
  if(working){
     timeNeeded = System.nanoTime() - startTime;
  }else{
    println(timeNeeded / pow(10, 9));
  }
  
  //println((-(p4.pixelY()-p3.pixelY())/(p4.pixelX()-p3.pixelX())) + "  " + prevLine);
  if((-(p4.pixelY()-p3.pixelY())/(p4.pixelX()-p3.pixelX()))== prevLine){
    working = false;
  }
  
  
}


void mousePressed(){
  working = false;
  
}