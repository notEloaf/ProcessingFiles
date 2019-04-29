
float f(float x){
  //y = mx + b
  return  0.5 * x + 0;
}



class Point{
  
  float x;
  float y;
  int label;
  float bias = 1;
  
  Point(float x_, float y_){
    x = x_;
    y = y_;
    
  }
  
  Point(){
  x= random(-0.9, 0.9);
  y= random(-0.9, 0.9);
  
  float lineY = f(x);

  
  if(y> lineY){
    label = 1;
  }else{
    label = -1;
  }
 }

   float pixelX(){
    return map(x, -1, 1, 0, width);
  }
  float pixelY(){
    return map(y, -1, 1, height, 0);
  } 
  
  void show(){
    if(label==1){
      fill(255);
    }else if(label == -1){
      fill(0);
    }
    
    float px = pixelX();
    float py = pixelY();
    ellipse(px,py,12,12);  
    
  }
}