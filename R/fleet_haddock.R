#' @title fleet_haddock
#' @description This is a wrapper function that facilitates extracting information for the haddock fleets.
#' All of the information used to identify fleets is stored in the package's associated data files -
#' LIC_CORE, LIC_AREAS, and LIC_GEAR_SPEC.  The various wrappers can have different options (e.g.
#' MOBILE vs FIXED, WESTERN vs EASTERN, 4XY vs 5ZJM, small mesh vs large mesh, diamond vs square
#' mesh, etc), and depending on which options are selected, different fleets are identified, and
#' their data is extracted.
#' @param marfGear default is \code{''}. This is a vector of MARFIS gear codes known to have caught
#' this species. The default values can be replaced with a smaller selection to only return information
#' for a gear-specific subset of fishing activity.
#' @param type default is \code{NULL}. This is either "FIXED" or "MOBILE".
#' @param area default is \code{"ALL"}. This is either "4X5Y", "5ZJM", or "ALL".
#' @inherit set_defaults params
#' @inheritDotParams set_defaults -lics -gearSpecs -area
#' @examples \dontrun{
#' db <- fleet_haddock(type = "FIXED",
#'                     area = "4X5Y",
#'                     year = 2018,
#'                     useLocal = F,
#'                     oracle.username = "<name>",
#'                     oracle.password="<password>",
#'                     oracle.dsn="PTRAN",
#'                     usepkg = "roracle"
#'                     )
#' local <- fleet_haddock(type = "MOBILE",
#'                        area = "5ZJM",
#'                        year = 2018,
#'                        useLocal = T,
#'                        data.dir = "c:/data_folder"
#'                       )
#'                        }
#' @family fleets
#' @inherit fleet_ return
#' @author  Mike McMahon, \email{Mike.McMahon@@dfo-mpo.gc.ca}
#' @note Hardcoded parameters for this fleet are as follows:
#' \itemize{
#'   \item \code{marfSpp} = 110
#'   \item \code{isdbSpp} = 11
#'   \item \code{tripcd_id} = 7001
#'   \item \code{fleet} = HADDOCK_MOB or HADDOCK_FIXED, depending on selections
#'   \item \code{area} = 4X5Y, 5ZJM, or all depending on selections
#'   \item \code{gearSpecs} = 4X5Y or ALL, depending on selections
#'
#' }
#' @inherit fleet_ details
#' @export
fleet_haddock <- function(marfGear = c(12, 41, 51, 59), type = NULL, area= "ALL", useLocal = NULL, ...){
  if(!paramOK(useLocal = useLocal, p=list(...))) stop("Please provide additional parameters as directed above")
  type <- toupper(type)

  area <- toupper(area)

  if (!is.null(type) && type =="MOBILE"){
    marfGear = c(12)
  }else if (!is.null(type) && type =="FIXED"){
    marfGear = c(41,51,59)
  }

  gearSpecs <- ifelse(type == "MOBILE", "4X5Y", "ALL")
  data <- fleet_(fleet = "HADDOCK", marfSpp = 110, marfGear = marfGear, isdbSpp = 11, area = area, areaFileField = "COD_BEST", gearSpecs = gearSpecs, tripcd_id = c(7001), useLocal = useLocal,...)
  return(data)
}
