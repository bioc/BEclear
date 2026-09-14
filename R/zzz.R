## BEclear builds its log messages with paste(). Without glue installed, logger
## formats messages with sprintf, which fails on any message containing "%",
## such as "% of the data" in clearBEgenes(). Plain paste formatting for this
## package's namespace avoids that, whatever formatter is configured globally.
.onLoad <- function(libname, pkgname) {
    logger::log_formatter(logger::formatter_paste, namespace = pkgname)
}
