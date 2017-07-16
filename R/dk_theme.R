#' DataKind ggplot2 Theme
#'
#' A ggplot2 theme object to make creating plots and visualisations simpler
#' and easier. Just add "+ dk_theme" when building your plot layers.
#'
#' @format A list with a ggplot2 object data.
#' \describe{
#'   \item{dk_theme}{ggplot2 theme object}
#'   \item{scale_colour_manual}{modifies the default colours to datakind palette}
#'   \item{scale_fill_manual}{modifies the default fill colours to datakind palette}
#' }
#' @examples
#' \dontrun{
#' ggplot2::ggplot(data.frame( y = runif(100, min = 0, max = 20) +
#'   seq(1, 100, 1),
#'   x = seq(1, 100, 1),
#'   z = rep_len(c("a", "b", "c", "d"), 100)),
#'   ggplot2::aes(x, y, colour = z, fill = z)) +
#'   ggplot2::geom_point() +
#'   ggplot2::facet_wrap(~z, nrow = 2) +
#'   ggplot2::geom_smooth(se = TRUE) +
#'   ggplot2::labs(title = "Some Data (2011)",
#'       x = "Range", y = "Value") +
#'   dk_theme +
#'   ggplot2::scale_fill_manual(values = dk_sequential_palette)
#'
#' ggplot2::ggplot(data.frame( x = c('Primary 1', 'Primary 2',
#'                                  'Secondary 1', 'Secondary 2'),
#'                            y = runif(4, 10, 100)),
#'                ggplot2::aes(x,y, fill = x)) +
#'   ggplot2::geom_bar(stat = "identity") +
#'   ggplot2::labs(title = "Some Data (2011)",
#'                 x = "Range", y = "Value") +
#'   dk_theme
#'   }
#'
"dk_theme"

#
# dk_theme <-
#   list (ggplot2::theme(plot.title =
#                          ggplot2::element_text(face = 2, size = rel(1),
#                                                hjust = 0,
#                                                colour = dk_palette[1]),
#                        axis.title =
#                          ggplot2::element_text(colour = dk_palette[1],
#                                                size = rel(0.8)),
#                        axis.text =
#                          ggplot2::element_text(colour = dk_palette[1],
#                                                size = rel(0.8)),
#                        axis.text.x =
#                          ggplot2::element_text(vjust = 1,
#                                                angle = 0),
#                        axis.line = element_line(colour = dk_palette[1]),
#                        strip.background =
#                          ggplot2::element_rect(dk_palette[5]),
#                        legend.title.align = 0.5,
#                        legend.title = element_text(colour = dk_palette[1],
#                                                    size = rel(0.8)),
#                        legend.text = element_text(colour = dk_palette[1],
#                                                   size = rel(0.8)),
#                        strip.text =
#                          ggplot2::element_text(colour = dk_palette[1],
#                                                size = ggplot2::rel(1),
#                                                vjust = 0.5),
#                        panel.background =
#                          ggplot2::element_rect(fill =
#                                                  paste0(dk_palette[5], 75)),
#                        panel.grid.minor =
#                          ggplot2::element_blank(),
#                        panel.grid.major.x =
#                          ggplot2::element_blank(),
#                        panel.grid.major.y =
#                          ggplot2::element_blank()),
#         scale_colour_manual(values = dk_palette[1:4]),
#         scale_fill_manual(values = dk_palette[1:4]))
#
#
# ggplot2::ggplot(data.frame( y = runif(100, min = 0, max = 20) +
#                               seq(1, 100, 1),
#                             x = seq(1, 100, 1),
#                             z = rep_len(c("a", "b", "c", "d"), 100)),
#                 aes(x, y, colour = z, fill = z)) +
#   geom_point() +
#   facet_wrap(~z, nrow = 2) +
#   geom_smooth(se = TRUE) +
#   labs(title = "Some Data (2011)",
#   x = "Range", y = "Value") +
#   labs(title = "Some Data (2011)",
#        x = "Range", y = "Value") +
#   dk_theme
#
# ggplot2::ggplot(data.frame( x = c('Primary 1', 'Primary 2',
#                                   'Secondary 1', 'Secondary 2'),
#                             y = runif(4, 10, 100)),
#                 aes(x,y, fill = x)) +
#   geom_bar(stat = "identity") +
#   labs(title = "Some Data (2011)",
#        x = "Range", y = "Value") +
#   dk_theme
