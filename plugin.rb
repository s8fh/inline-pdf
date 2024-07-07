# frozen_string_literal: true
# name: inline-pdf
# about: Formats and displays PDFs in-line
# version: 1.0.0
# authors: Discourse

module SendPdfInline
  module UploadsControllerExtension
    def send_file( path,options={} )
      options[:disposition] = :inline if options.key?(:content_type) and options[:content_type]=="application/pdf"
      super(path,options)
    end
  end
end

after_initialize do
  ::UploadsController.prepend SendPdfInline::UploadsControllerExtension
end
