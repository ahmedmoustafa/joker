
#' Print Hello
#'
#' @param name Name
#'
#' @export
#'
#' @examples
#' hello ("Basbousa")
hello <- function (name) {
  print (paste ("Hello", name, sep = " "))
}


joker_palettes <- list(
  phoneix = c("#B01A19", "#CEA712", "#82C16F", "#90886C", "#BEC3B5"),
  ledger = c("#775EAE", "#BBBE74", "#6B271F", "#886821", "#3A3D20", "#222528")
)


#' Joker palette generator
#'
#' @param name Name of desired palette. Choices are:
#'   \code{joker_2019}
#' @param n Number of colors desired.
#'
#' @return A vector of colors.
#' @export
#'
#' @examples
#' joker("phoneix")
#' joker("heath", 3)

joker <- function(name, n) {

  pal <- joker_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of requested colors greater than whatthis palette can offer")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)
}


#' print.palette
#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}
