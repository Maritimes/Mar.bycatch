#' @title get_fleet_local
#' @description This function extracts all of the Vessel/Licence combinations
#' associated with a particular fleet for a particular date range.
#' @param dateStart default is \code{NULL}. This is the start date (YYYY-MM-DD)
#' of the window of time you want to look at.
#' @param dateEnd default is \code{NULL}. This is the end date (YYYY-MM-DD)
#' of the window of time you want to look at.  If this is left blank, 1 year of
#' data will be returned.
#' @param mdCode default is \code{NULL}. This is the MARFIS Monitoring
#' Document code used to identify fleets. If this is left as NULL, a popup
#' will allow the user to select one from a list.
#' Valid codes are shown below:
#' \itemize{
#' \item 1 = 'FIXED GEAR GROUNDFISH'
#' \item 2 = 'MOBILE GEAR GROUNDFISH'
#' \item 3 = 'ATLANTIC BLUEFIN TUNA'
#' \item 4 = 'SWORDFISH HARPOON'
#' \item 5 = 'SWORDFISH/SHARK LONGLINE'
#' \item 6 = 'FIXED GEAR HERRING'
#' \item 7 = 'HERRING MOBILE GEAR'
#' \item 8 = 'TRANSPORT'
#' \item 9 = 'MACKEREL - FIXED GEAR'
#' \item 10 = 'CRAB'
#' \item 11 = 'EXPLORATORY ROCK/JONAH CRAB'
#' \item 12 = 'INSHORE DREDGE SHELLFISH'
#' \item 13 = 'OFFSHORE CLAM'
#' \item 14 = 'SCALLOP'
#' \item 15 = 'OFFSHORE SCALLOP'
#' \item 16 = 'MOBILE SHRIMP'
#' \item 17 = 'WHELK/MOONSNAIL'
#' \item 18 = 'SEA URCHIN'
#' \item 19 = 'OFFSHORE LOBSTER'
#' \item 26 = 'TEST'
#' \item 27 = 'SAINT JOHN RIVER ATLANTIC STURGEON FISHERY'
#' \item 28 = 'SHRIMP TRAP'
#' \item 29 = 'INTERNATIONAL'
#' \item 30 = 'DECK AND'
#' \item 31 = 'NORTHERN SHRIMP SLIP - CONVERSION'
#' \item 32 = 'NATIONAL SEA SLIP'
#' \item 33 = 'ELVER FISHERY'
#' \item 39 = 'SEA CUCUMBER'
#' \item 40 = 'TEST BLANK'
#' \item 41 = 'SEA CUCUMBER'
#' \item 46 = 'GENERIC CATCH ENTRY'
#' \item 47 = 'HAGFISH'
#' \item 48 = 'COMMERCIAL OYSTER FISHERY'
#' \item 49 = 'LOBSTER'
#' \item 50 = 'SHRIMP TRANSPORT'
#' \item 52 = 'SEA URCHIN'
#' \item 53 = 'SCALLOP DIVE'
#' }
#' @param gearCode default is \code{NULL}. In some cases, a fleet will contain multiple
#' gear types. Setting this to \code{NULL} (the default) will prompt you to
#' select gears from the available values (if there are multiple).  Setting it to
#' \code{'all'} will get all gear types.  Entering a vector of MARFIS gear codes
#' (e.g. \code{c(51,81)}) will only return those gear codes.
#' Valid codes are shown below:
#' \itemize{
#' \item 0 = 'UNKNOWN'
#' \item 10 = 'OTTER TRAWL'
#' \item 11 = 'OTTER TRAWL, SIDE'
#' \item 12 = 'OTTER TRAWL, STERN'
#' \item 13 = 'MIDWATER TRAWL'
#' \item 14 = 'MIDWATER TRAWL, SIDE'
#' \item 15 = 'MIDWATER TRAWL STERN'
#' \item 16 = 'OTTER TRAWL, PAIR'
#' \item 17 = 'MIDWATER TRAWL, PAIR'
#' \item 18 = 'SEMI PELAGIC TRAWL'
#' \item 19 = 'SHRIMP TRAWL'
#' \item 20 = 'MODIFY SHRIMP MIDWTR'
#' \item 21 = 'DANISH SEINE'
#' \item 22 = 'SCOTTISH SEINE'
#' \item 24 = 'BEACH/DRAG/BAR SEINE'
#' \item 31 = 'PURSE SEINE'
#' \item 32 = 'LAMPARA'
#' \item 33 = 'PAIR SEINE'
#' \item 41 = 'GILL NET (SET OR FIXED)'
#' \item 42 = 'GILL NET, DRIFT'
#' \item 43 = 'GILL NET'
#' \item 44 = 'SQUARE NET'
#' \item 45 = 'BOX NET'
#' \item 46 = 'BAG NET'
#' \item 47 = 'FYKE NET'
#' \item 51 = 'LONGLINE'
#' \item 52 = 'AUTOMATED JIGGER GROUNDFISH'
#' \item 53 = 'JIGGER'
#' \item 54 = 'TENDED LINE'
#' \item 55 = 'MECHANICAL JIGGER'
#' \item 59 = 'HAND LINE'
#' \item 60 = 'ANGLING'
#' \item 61 = 'TRAP NET'
#' \item 62 = 'TRAP'
#' \item 63 = 'WEIR'
#' \item 64 = 'STATIONARY LIFT NETS'
#' \item 65 = 'BOW NET'
#' \item 70 = 'DIP NET'
#' \item 71 = 'DRAG'
#' \item 72 = 'DREDGE, HAND'
#' \item 73 = 'MECHANICAL DIGGER'
#' \item 74 = 'HYDRAULIC DEVICE'
#' \item 75 = 'DIVING'
#' \item 76 = 'DIVER'
#' \item 78 = 'WING (DIP NET)'
#' \item 81 = 'HARPOON/SPEAR'
#' \item 82 = 'SEAL HUNTING'
#' \item 83 = 'SPEAR'
#' \item 84 = 'EEL POT'
#' \item 85 = 'ELECTRIC HARPOON'
#' \item 90 = 'MISCELLANEOUS'
#' \item 91 = 'RAKES/TONGS'
#' \item 92 = 'POUNDS'
#' \item 93 = 'DRAG RAKE'
#' \item 95 = 'PUMPER'
#' \item 96 = 'HAND/HANDHELD TOOL'
#' \item 98 = 'FIXED GEAR'
#' }
#' @param nafoCode default is \code{NULL}. This is a vector of NAFO AREAS (MARFIS) that will be
#' used to limit the fleet to.  If this is left as NULL, a popup will allow the user to select
#' valid values from a list.
#' @param gearSpType default is \code{NULL}. This is a vector of MARFIS codes describing the type of
#' gear.  For example, mesh gear can be either "D" or "S" (Diamond or Square).  If this is left as
#' NULL, a popup will allow the user to select valid values from a list.
#' @param gearSpSize default is \code{NULL}.This is a vector of acceptable sizes for the gear.  This
#' may describe mesh, hooks or traps.  If this is left as NULL, a popup will allow the user to select
#' valid values from a list.
#' @param noPrompts default is \code{FALSE}. If set to True, the script will ignore
#' any parameters that might otherwise be used to filter the data. For example, if you set \code{noPrompts = T}
#' and set \code{gearCode = NULL}, you will not be prompted to select a gear code - ALL gear codes
#' will be returned that match your other filters.
#' @param quietly default is \code{FALSE}.  This indicates whether or not
#' information should be shown as the function proceeds.  This would be set to TRUE if you wanted to
#' embed the script into a function rather than running it interactively.
#' @family fleets
#' @return returns a data.frame with 6 columns - "GEAR_CODE", "GEAR_DESC",
#'         "MD_CODE", "MD_DESC", "VR_NUMBER", "LICENCE_ID"
#' @author  Mike McMahon, \email{Mike.McMahon@@dfo-mpo.gc.ca}
#' @export
get_fleet_local<-function(data.dir=NULL,
                          quietly = FALSE,
                          dateStart = NULL, dateEnd = NULL,
                          mdCode = NULL,
                          gearCode = NULL, nafoCode = NULL,
                          gearSpType = NULL, gearSpSize= NULL,
                          useDate = NULL, vessLen = NULL,
                          noPrompts =FALSE){
  mdCode=tolower(mdCode)
  gearCode=tolower(gearCode)
  keep<-new.env()
  keep$mdDone <- keep$gearDone <- keep$nafoDone <- keep$gearSpecsDone <- keep$canDoGearSpecs <- keep$vessLenDone <- FALSE
  #if no end date, do it for 1 year
  if (is.null(dateEnd)) dateEnd = as.Date(dateStart,origin = "1970-01-01")+lubridate::years(1)
  df <- get_fleetBasic_local(keep, dateStart, dateEnd, data.dir, mdCode, gearCode, nafoCode, useDate, vessLen)
  bad = c("MONIT.*","DOCU.*","/ .*","FISHING .*","LOG.*"," FI$")
  for (b in 1:length(bad)){
    df$MD_DESC = sub(bad[b], "", df$MD_DESC)
  }
  df$MD_DESC <- trimws(df$MD_DESC)
  #Further narrow the data using md and gear - prompting if needed
  df = applyFilters(cxn = -1, keep = keep, quietly = quietly, df = df, mdCode=mdCode,
                    gearCode=gearCode, nafoCode = nafoCode, gearSpType = gearSpType, gearSpSize = gearSpSize,
                    dateStart = dateStart, dateEnd = dateEnd, noPrompts = noPrompts, useDate = useDate)
  if(nrow(df)<1) {
    cat(paste0("\n","No records found"))
    return(NULL)
  }else{
    df$NAFO <-NULL
    df <- unique(df[with(df,order(VR_NUMBER, LICENCE_ID, MD_CODE, GEAR_CODE )),])
    # cat("Final: ",nrow(df),"\n")
    return(df)
  }
}
