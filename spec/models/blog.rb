require 'spec_helper'

	describe Admin::Blog do
  	
  	it 'validates presence of title' do
  		blog = Admin::Blog.new(title: '')
  		blog.valid?
  		expect(blog.errors[:title]).to include("can't be blank")
  	end

  	it 'validates presence of body' do
  		blog = Admin::Blog.new(body: '')
  		blog.valid?
  		expect(blog.errors[:body]).to include("can't be blank")
  	end

  	it 'validates uniqness of title' do
  		Admin::Blog.create(title: 'Title', body: "Never in all their history have men been able truly to conceive of the
		  world as one: a single sphere, a globe, having the qualities of a globe, a
		  round earth in which all the directions eventually meet, in which there is
		  no center because every point, or none, is center — an equal earth which all
		  men occupy as equals. The airman's earth, if free men make it, will be
		  truly round: a globe in practice, not in theory. Science cuts two ways,
		  of course; its products can be used for both good and evil.")
		  blog = Admin::Blog.new(title: 'Title', body: "Never in all their history.")
		  blog.save
  		expect(blog.errors[:title]).to include('has already been taken')
  	end

  	it 'validates length of body' do
  		blog = Admin::Blog.new(body: 'abcd')
  		blog.valid?
  		expect(blog.errors[:body]).to include('is too short (minimum is 100 characters)')
  	end

  end

  describe CreateBlog do
  	it 'returns true if blog saved' do
			is_saved = CreateBlog.publish_new_blog(title: 'Title', body: "Never in all their history have men been able truly to conceive of the
		  world as one: a single sphere, a globe, having the qualities of a globe, a
		  round earth in which all the directions eventually meet, in which there is
		  no center because every point, or none, is center — an equal earth which all
		  men occupy as equals. The airman's earth, if free men make it, will be
		  truly round: a globe in practice, not in theory. Science cuts two ways,
		  of course; its products can be used for both good and evil.")
		  expect(is_saved).to eql(true)
  	end

  	it 'returns false if blog not saved' do
			is_saved = CreateBlog.publish_new_blog(title: 'Title', body: '')
		  expect(is_saved).to eql(false)
  	end
  end

  describe BlogList do
  	it 'returns list of all blogs when initialize without arguments' do
  		blog_list = BlogList.new.get_list
  		expect(blog_list).to match_array(Admin::Blog.all)
  	end
  end
