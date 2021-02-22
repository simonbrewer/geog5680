make_map <- function(shp, variable, nclr, pal="Greens", logtrans=FALSE) {
  plotvar <- shp@data[,variable]
  if (logtrans) {
    plotvar <- log10(plotvar)
  }
  class <- classIntervals(plotvar, nclr, style = "jenks")
  plotclr <- brewer.pal(nclr, pal) 
  colcode <- findColours(class, plotclr, digits = 3)
  plot(shp, col = colcode, border = "grey", axes = T)
  title(main = variable)
  ## Set number of columns for legend
  ncols=1
  if (nclr > 5) {
    ncols = 2
  }
  legend("bottomleft", legend = names(attr(colcode,"table")), 
         fill = attr(colcode, "palette"), ncol = ncols)
}