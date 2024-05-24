class DrawAnyShape {
  void drawRhombus(var n) {
    var c, k;
    var space = n - 1;

    for (k = 1; k <= n; k++) {
      String line = "";
      for (c = 1; c <= space; c++) line += " ";
      space--;

      for (c = 1; c <= 2 * k - 1; c++) {
        if (c == 1 || c == 2 * k - 1) {
          line += "*"; // In ra dấu * ở đầu và cuối
        } else {
          line += " "; // In ra dấu cách ở giữa
        }
      }

      print(line);
    }

    space = 1;

    for (k = 1; k <= n - 1; k++) {
      String line = "";
      for (c = 1; c <= space; c++) line += " ";

      space++;
      for (c = 1; c <= 2 * (n - k) - 1; c++) {
        if (c == 1 || c == 2 * (n - k) - 1) {
          line += "*"; // In ra dấu * ở đầu và cuối
        } else {
          line += " "; // In ra dấu cách ở giữa
        }
      }

      print(line);
    }
  }
}
