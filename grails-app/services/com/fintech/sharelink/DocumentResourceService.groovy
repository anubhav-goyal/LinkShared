package com.fintech.sharelink

import commandobjects.resources.DocumentResourceCO
import grails.transaction.Transactional
import org.apache.commons.io.IOUtils

@Transactional
class DocumentResourceService {

    def serviceMethod() {

    }

    Resource save(DocumentResourceCO documentResourceCO){
        documentResourceCO.file = uploadFile(documentResourceCO)
        if(documentResourceCO.validate()){
            DocumentResource documentResource = new DocumentResource(documentResourceCO)
            documentResource.save()
        }
    }

    String uploadFile(DocumentResourceCO documentResourceCO){
        String fileLabel="${documentResourceCO.user.username}"
        try{
                //appending file extension. In my requirement, user can modify original file name providing fileLabel. So, if user provides fileLabel, we //should save file with that name.
                fileLabel +="${documentResourceCO.document.originalFilename}"

        if (documentResourceCO.document.empty) {
                return null
            }

            //get uploaded file's inputStream
            InputStream inputStream = documentResourceCO.document.inputStream
            //get the file storage location
            def fileTobeStoredInDirPath = "/home/anubhav/practice/LinkShared/web-app/documents/"
            //create a new file with fileLabel
            File file = new File(fileTobeStoredInDirPath,fileLabel)
            //This support both overriding and creating new file
            //If two of these fails, that means got some internal issue. May be new file creation permissions issue
            if (file.exists() || file.createNewFile()) {
                //to close the fileOutStream, opening it using withOutStream closure
                file.withOutputStream{fos->
                    IOUtils.copyLarge(inputStream, fos)
                }

            }else{

                throw new RuntimeException("error while creating  ${file} at ${fileTobeStoredInDirPath}")
            }
        }
        catch (Exception ex){
            println("Exception ${ex}")
            return null
        }
    }

}

