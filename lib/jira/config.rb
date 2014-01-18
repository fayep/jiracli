module Jira

    Config=OpenStruct.new YAML.load_file(File.expand_path('../../../config/jira.yml',__FILE__))

end
