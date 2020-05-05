int[][] fissionmap;
int[][] data; // MAKE TXT FILE THAT OUTPUTS ALL TEXT VARS AS A MATRIX WITH FRAMECOUNT TO BE PLOTTED IN MATLAB
// ALSO MAKE MAKE OF FISSIONS AND ABSORBTIONS


ArrayList<Atom> atom = new ArrayList<Atom>();
int fissionct = 0;
int[] xNew; 
int[] yNew;
int[] xNewnf;
int[] yNewnf;
int neutroniter;
int nonfissioniter;
int  nCount, nfCount, fCount;

void setup() {
  size(600, 600);
  fissionmap = new int[2][10000];
  //fullScreen();
  textSize(20);
  for (int i = 0; i < 1000; i++) {
    atom.add(new Atom(true, false, false, 0, 0));
  }
  for (int i = 0; i < 250; i++) {
    atom.add(new Atom(false, false, true, floor(random(width)), floor(random(height))));
  }
  xNew = new int[10000];
  yNew = new int[10000];
  xNewnf =new int[10000];
  yNewnf = new int[10000];
  //frameRate(5);
}

void draw() {
  nCount = 0;
  nfCount = 0;
  fCount =0;
  neutroniter = 0;
  nonfissioniter = 0;
  background(0);
  strokeWeight(10);
  stroke(255);

  fissabsorb();

  //println(neutroniter);
  for (int i = atom.size() - 1; i >= 0; i--) {       
    Atom atom1 = atom.get(i);
    if (atom1.dead == true) {
      atom.remove(i);
    }
  }

  for (int i = 0; i < fissionct; i++) {
    noStroke();
    fill(255, 0, 0, 10);
    ellipse(fissionmap[0][i], fissionmap[1][i], 65, 65);
  }

  for (int i = 0; i < atom.size(); i++) {
    Atom particle = atom.get(i);
    particle.update();
    particle.animate();
  }
  for (int i = 0; i < neutroniter; i++) {
    atom.add(new Atom(false, true, false, xNew[i], yNew[i]));
  }
  for (int i = 0; i < nonfissioniter; i++) { 
    atom.add(new Atom(false, false, true, xNewnf[i], yNewnf[i]));
    //atom.add(new Atom(false, false, true, xNewnf[i], yNewnf[i]));
  }
  fill(255);
  //println("Fission Count = "+fissionct);
  text("Fissions Occured = "+fissionct, 10, 20);
  text("Neutron Count = "+nCount, 10, 35);
  text("NF Count = "+nfCount, 10, 50);
  text("F Count = "+fCount, 10, 65);
  text("--------------------", 10, 80);
  text("Total Count = "+(nCount+nfCount+fCount), 10, 95);
  //saveFrame("pics/pic_###.png");

  //if (frameCount > 450) exit();
}

void mousePressed() {
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));
  atom.add(new Atom(false, true, false, mouseX, mouseY));

  //println("Mouse Clicked");
}
