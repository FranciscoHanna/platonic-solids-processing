class Octaedro extends SolidoPlatonico{

  float a;
  PVector[] vert = new PVector[6];
  int[][] caras;

  // Constructores
  Octaedro(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    super(radio, verticeRadio, mostrarCaras, transX, transY, transZ);
    init();
  }

  Octaedro(float radio, float verticeRadio) {
    super(radio, verticeRadio);
    init();
  }

  Octaedro(float radio) {
    super(radio);
    init();
  }

  // Calcular geometria
  void init() {
    a = radio;
    vert[0] = new PVector( a, 0, 0 ); 
    vert[1] = new PVector( 0, a, 0 );
    vert[2] = new PVector( 0, 0, a ); 
    vert[3] = new PVector( -a, 0, 0 ); 
    vert[4] = new PVector( 0, -a, 0 ); 
    vert[5] = new PVector( 0, 0, -a );
  }

  // Muestra octaedro 
  void crear() {
    translate(transX, transY, transZ);
    rotar();
    
    // Vertices
    if (verticeRadio > 0) {
      for (int i=0; i<6; i++)
        verticeEsfera(vert[i].x, vert[i].y, vert[i].z, verticeRadio);
    }

    if (!mostrarCaras) { 
      noFill();
    } else { 
      fill(carasColor[0], carasColor[1], carasColor[2], carasColor[3]);
    }

    beginShape(TRIANGLE_FAN); 
    vertex(vert[4].x, vert[4].y, vert[4].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    vertex(vert[2].x, vert[2].y, vert[2].z);
    vertex(vert[3].x, vert[3].y, vert[3].z);
    vertex(vert[5].x, vert[5].y, vert[5].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    endShape();

    beginShape(TRIANGLE_FAN);    
    vertex(vert[1].x, vert[1].y, vert[1].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    vertex(vert[2].x, vert[2].y, vert[2].z);
    vertex(vert[3].x, vert[3].y, vert[3].z);
    vertex(vert[5].x, vert[5].y, vert[5].z);
    vertex(vert[0].x, vert[0].y, vert[0].z);
    endShape();
  }
}