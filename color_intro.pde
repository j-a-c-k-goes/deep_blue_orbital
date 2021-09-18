float start_angle = 0;
float angle_bump = 0;

color color_c = color(10, 10, 10, 172);
color color_b = color(255, 255, 255, 45);
color color_a = color(255, 255, 10, 255);

float r = 0;
float g = 255;
float b = 0;
float a = 255;

void setup() {
  size(1000, 1000, P3D);
  smooth();
  frameRate(60);
}
void draw() {
  background(color_c);
  noStroke();

  float radius = width;
  int circle_count = 0;
  float angle = start_angle;

  while (radius > 0) {

    float tan_wave = map(tan(radians(frameCount)) + sin(radians(-frameCount * radius)), -1, 1, -1, 1);
    float sin_wave = map(cos(radians(frameCount)) + tan(radians(frameCount * radius)), -1, 1, -1, 1);



    push();
    fill(r, b, b, a);
    arc(width / 2, height / 2, radius * tan_wave, radius * sin_wave, angle, (angle + PI));
    pop();

    push();
    fill(b, r, g, a);
    arc(width / 2, height / 2, radius * tan_wave, radius * sin_wave, -angle, (-angle + PI));
    pop();

    push();
    noFill();
    lights();
    sphereDetail(10);
    stroke(r, b, a, b);
    strokeWeight(200);
    translate(width / 2, height / 2);
    rotateX((width / 2 + r) / sin_wave);
    rotateY(height / 2 + r);

    sphere(200 * tan_wave);
    //ellipse(width / 2 + r, height / 2 + r, radius * tan_wave, radius / tan_wave);
    //println("tan wave:", tan_wave);
    pop();

    radius -= 25.00;
    angle += angle_bump;
  }

  float iter_value_a = 0.01;
  float iter_value_b = 0.005;
  start_angle += iter_value_a;
  angle_bump += iter_value_b;

  if (g <= 0 && a <= 0) {
    g = 255;
    a = 255;
  } else if (r >= 255 && b >= 255) {
    r = 0;
    b = 0;
  }

  r += .01;
  g -= .01;
  b += .01;
  a -= .01;
  println("r:", r);

  saveFrame("out_a/frame_####.jpg");
}
