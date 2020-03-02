layout: _drafts

title: Shiny Learning note

date: 2018-07-06

# Button Download in Shiny apps - function <u>downloadHandler</u>

```R
downloadHandler(filename, content, contentType = NA, outputArgs = list())
```

Explication precise is here : 

[Function downladHandler()]: https://shiny.rstudio.com/reference/shiny/1.0.5/downloadHandler.html



### Arguments in content

 `file` is the file that data written into. for example:

Example 1, generate report in format `.xlsx` with `saveWorkbook`

```R
output$outputId_downloadRatingReport <- downloadHandler(
          filename = function(){
            paste0("rr_", genRR_clientName, "_", genRR_assetName, "_", genRR_status, "_mb18.xlsx")
          },
          incProgress(amount = 0.6, detail = "Génération du rapport en cours"),
          content = function(file){
            saveWorkbook(generateRepport_MB18(overViewDataFrame = donne_evaluer_literal_MB18,
                                              clientName = genRR_clientName,
                                              assetName = paste0(genRR_assetName, "_", genRR_status),
                                              pathDatacollectFile = react_dcFileMB18(),
                                              pathSyntheModel = react_modelSyntheticMB18(),
                                              pathReportModel = react_rrModelMB18(),
                                              pathIntrant = react_intrantFileMB18()
                          ), file
            )
            #file.rename(fname, file)
          }
        )
```

Example 2, generate `.csv`file with function `write.table`

```R
output$outputId_downloadAllNote <- downloadHandler(
        filename = function(){
          paste0("allNote_allActif_MB14_", as.character(Sys.Date()), ".csv")
        },
        content = function(file){
          write.table(cbind(getIntrant_ClientAssetName_MB14(react_intrantFileMB14()), donne_evaluer_MB14), file,
                      append = FALSE, quote = TRUE, sep = ";",
                      eol = "\n", na = "NA", dec = ",", row.names = FALSE,
                      col.names = TRUE, qmethod = c("escape", "double"))
        }
      )
```

