require "bundler/setup"
require "pathname"
require 'yaml'

require_relative "linter/document"


class Linter

  attr_accessor :docs, :posts, :errors

  def initialize
    md_files = glob("**/*.md")
    skip_patterns = [/README.md/, %r{[^/]*/examples/}, %r{\A_includes/}]

    skip_patterns.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    @docs = md_files.map {|fn| Document.new(fn) }
    @posts = @docs.select {|doc| doc.filename =~ %r{/_posts/} }

    @errors = Hash.new {|h, k| h[k] = [] }
  end

  def check
    print "Checking markdown files..."

    docs.each do |doc|
      errors[doc] << "  missing lang variable"  if doc.lang_missing?
    end

    posts.each do |doc|
      errors[doc] << "  missing author variable"  if doc.author_missing?
      errors[doc] << "  date mismatch between filename and YAML front matter (UTC)"  if doc.date_mismatch?
    end

    report

    exit(1)  if errors.any?
  end

  private

  def glob(pattern)
    Pathname.glob(pattern).reject {|path| path.expand_path.to_s =~ %r{\A#{Regexp.escape(Bundler.bundle_path.to_s)}/} }.map(&:to_s)
  end

  def report
    if errors.empty?
      puts " ok"
    else
      puts
      errors.each do |doc, messages|
        puts doc.filename
        puts messages
      end
    end
  end
end
