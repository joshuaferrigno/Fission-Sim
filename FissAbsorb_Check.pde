void fissabsorb() {
  //fill(#FF0000,1);
  
  for (int j = 0; j < atom.size(); j++) {
    for (int i = 0; i < atom.size(); i++) {
      //println(j);
      if (i != j) {
        Atom atom1 = atom.get(i);
        Atom atom2 = atom.get(j);

        if ((atom1.fissionable) && (!atom1.dead) && (atom2.neutron) && (!atom2.dead)){// || (atom1.neutron) && (atom2.fissionable)) {

          float distanceN = dist(atom1.x, atom1.y, atom2.x, atom2.y);
          if (distanceN < 10) { /// FISSION
            int neutronct = floor(random(2, 3));
            int x = floor((atom1.x + atom2.x) / 2);
            int y = floor((atom1.y + atom2.y) / 2);

            //fissionmap[ = (x,y,50,50);

            atom1.dead = true;
            atom2.dead = true;

            for (int k = 0; k < neutronct; k++) {
              //println(neutronct);
              //atom.add(new Atom(false, true, false, x, y));
              xNew[neutroniter] = x;
              yNew[neutroniter] = y;
              neutroniter++;
            }

            xNewnf[nonfissioniter] = x;
            yNewnf[nonfissioniter] = y;
            nonfissioniter++;
            //atom.add(new Atom(false, false, true, x, y));

            //particle.push(new Atom(false, false, true, x, y))
            fissionmap[0][fissionct] = x;
            fissionmap[1][fissionct] = y;
            fissionct++;
          }
        } else if ((atom1.nonfissionable) && (atom2.neutron) && (atom1.nfbool)){//|| (atom1.neutron) && (atom2.nonfissionable) && (atom2.nfbool)) {
          float distanceNf = dist(atom1.x, atom1.y, atom2.x, atom2.y);
          if (distanceNf < 10) { /// ABSORBTION
            if (atom1.neutron) {
              atom1.dead = true;
            } else if (atom2.neutron) {
              atom2.dead = true;
            }
          }
        }
      }
    }
  }
}
