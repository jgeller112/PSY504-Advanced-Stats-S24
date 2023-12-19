# List of Color Palettes
# Complete list of palettes.
#print out colors

numetalPalettes <- list(
  korn = list(c("#D01809", "#EC3D09", "#830301", "#B95011", "#DDA547", "#D45F1D", "#EDCA79", "#A4672A", "#AA5829", "#A4672A", "#FBE477")),
  evanescence = list(c("#13285B", "#20669E", "#3F7495", "#7CB5CD", "#3E6A92", "#6598C1", "#5E7797", "#2B405C","#94C6E3", "#2C4064")),
  linkinpark=list(c("#BEAE93", "#948370", "#803F30", "#78090C", "#560F11", "#55564F", "#6A6F77", "#CAC8B8", "#B5AEA6", "#732522")),
  limpbizkit=list(c("#F1922E", "#69516F", "#4C3C67", "#65669F", "#DC93A5", "#B27133", "#E6A0B5", "#D68A33", "#CE1915", "#981C2C"))
          )


nu_palettes <- function(palette_name) {
  palette <- numetalPalettes[[palette_name]]
return(palette[[1]])
}

# Function for printing palette

#' @export
#' @importFrom grDevices rgb
#' @importFrom graphics rect par image text

print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.92, n + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 2.5, family = "serif")
}
