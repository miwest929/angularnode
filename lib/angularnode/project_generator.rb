class ProjectGenerator
  def initialize(template_dir)
    @template_dir = template_dir
  end

  def generate(node_project, options = {})
    template_files = Dir.chdir(@template_dir) { Dir["**/*"].reject {|f| File.directory?(f)} }
    template_files.each do |f|
      dir = File.dirname(f)

      FileUtils.mkdir_p("#{node_project}/#{dir}")

      create_file("#{node_project}/#{f}", template(f, {project: node_project}))
    end
  end

private
  def template(template_name, options)
    template_file = File.readlines("#{@template_dir}/#{template_name}").join('')

    begin
      ERB.new(template_file).result( OpenStruct.new(options).instance_eval { binding })
    rescue SyntaxError => e
      puts "Failed to process #{template_name} as an ERB. Using the original content as the generated file."
      template_file
    end
  end

  def create_file(path, template_file)
    puts "Created #{path}..."

    File.open(path, 'w') {|f| f.write(template_file)}
  end
end

