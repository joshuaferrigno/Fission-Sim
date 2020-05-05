class Atom {
  int x, y, xdot, ydot;
  boolean fissionable, neutron, nonfissionable, dead = false;
  int speedvar = 20;
  int nfcount = 0;
  boolean nfbool = false;

  Atom(boolean fissionable_, boolean neutron_, boolean nonfissionable_, int x_, int y_) {
    x = x_;
    y = y_;
    fissionable = fissionable_;
    neutron = neutron_;
    nonfissionable = nonfissionable_;

    if (fissionable) {
      x = floor(random(width));
      y = floor(random(height));
      xdot = floor(random(-speedvar*.25, speedvar*.25));
      ydot = floor(random(-speedvar*.25, speedvar*.25));
    }
    if (neutron) {
      xdot = floor(random(-speedvar, speedvar));
      ydot = floor(random(-speedvar, speedvar));
    }
    if (nonfissionable) {
      xdot = floor(random(-speedvar*.5, speedvar*.5));
      ydot = floor(random(-speedvar*.5, speedvar*.5));
    }
  }


  void update() {
    //for (int i = 0; i < nonfissioniter; i++) {
    //  fissionmap[0][mapiter] = xNewnf[i];
    //  fissionmap[1][mapiter] = yNewnf[i];
    //  mapiter++;
    //}
    if (neutron) {
      nCount++;
      xdot*=.999999;
      ydot*=.999999;
      x += xdot;
      y += ydot;
      if (pow((xdot*xdot + ydot*ydot), .5) < 1) {
        dead = true;
      }
    } else {
      x += xdot;
      y += ydot;
    }
    if (fissionable) {
      fCount++;
      xdot = round(random(-5, 5));
      ydot = round(random(-5, 5));
    }
    if (nonfissionable) {
      nfCount++;
      xdot = round(random(-5, 5));
      ydot = round(random(-5, 5));
      if (!nfbool) {
        nfcount++;
        if (nfcount>10) nfbool = true;
      }
    }
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  void animate() {

    if (fissionable) {
      strokeWeight(10);
      stroke(#03FF1D);
      point(x, y);
    } else if (neutron) {
      // noStroke();
      strokeWeight(5);
      stroke(color(255, 204, 0));
      point(x, y);
    } else if (nonfissionable) {
      strokeWeight(10);
      stroke(#FE03FF);
      point(x, y);
    }
  }
}
