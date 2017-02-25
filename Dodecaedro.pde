class Dodecaedro extends SolidoPlatonico{

  float a,b,c;
  PVector[] vert;
  int[][] faces;

  // Constructores
  Dodecaedro(float radio, float verticeRadio, boolean mostrarCaras, int transX, int transY, int transZ) {
    super(radio, verticeRadio, mostrarCaras, transX, transY, transZ);
    init();
  }

  Dodecaedro(float radio, float verticeRadio) {
    super(radio, verticeRadio);
    init();
  }

  Dodecaedro(float radio) {
    super(radio);
    init();
  }

  // calculate geometry
  void init(){
    a = radio/1.618033989;
    b = radio;
    c = 0.618033989*a;
    faces = new int[12][5];
    vert = new PVector[20];
    vert[ 0] = new PVector(a, a, a);
    vert[ 1] = new PVector(a, a, -a);
    vert[ 2] = new PVector(a, -a, a);
    vert[ 3] = new PVector(a, -a, -a);
    vert[ 4] = new PVector(-a, a, a);
    vert[ 5] = new PVector(-a, a, -a);
    vert[ 6] = new PVector(-a, -a, a);
    vert[ 7] = new PVector(-a, -a, -a);
    vert[ 8] = new PVector(0, c, b);
    vert[ 9] = new PVector(0, c, -b);
    vert[10] = new PVector(0, -c, b);
    vert[11] = new PVector(0, -c, -b);
    vert[12] = new PVector(c, b, 0);
    vert[13] = new PVector(c, -b, 0);
    vert[14] = new PVector(-c, b, 0);
    vert[15] = new PVector(-c, -b, 0);
    vert[16] = new PVector(b, 0, c);
    vert[17] = new PVector(b, 0, -c);
    vert[18] = new PVector(-b, 0, c);
    vert[19] = new PVector(-b, 0, -c);
    
    faces[ 0] = new int[] {0, 16, 2, 10, 8};
    faces[ 1] = new int[] {0, 8, 4, 14, 12};
    faces[ 2] = new int[] {16, 17, 1, 12, 0};
    faces[ 3] = new int[] {1, 9, 11, 3, 17};
    faces[ 4] = new int[] {1, 12, 14, 5, 9};
    faces[ 5] = new int[] {2, 13, 15, 6, 10};
    faces[ 6] = new int[] {13, 3, 17, 16, 2};
    faces[ 7] = new int[] {3, 11, 7, 15, 13};
    faces[ 8] = new int[] {4, 8, 10, 6, 18};
    faces[ 9] = new int[] {14, 5, 19, 18, 4};
    faces[10] = new int[] {5, 19, 7, 11, 9};
    faces[11] = new int[] {15, 7, 19, 18, 6};
  }

  // draws dodecahedron 
  void crear(){
    translate(transX, transY, transZ);
    rotar();
    
    // vertexes
    if(verticeRadio > 0)
    {
      for(int i=0;i<20;i++)
        verticeEsfera(vert[i].x,vert[i].y,vert[i].z,verticeRadio);
    }
    
    if (!mostrarCaras) { 
      noFill();
    } else { 
      fill(carasColor[0], carasColor[1], carasColor[2], carasColor[3]);
    }
    
    for(int i=0; i<12; i++)
    {
      beginShape();
      for(int j=0;j<5;j++)
      {
        vertex(vert[faces[i][j]].x,vert[faces[i][j]].y,vert[faces[i][j]].z);
      }
      endShape();
    }
  }
}