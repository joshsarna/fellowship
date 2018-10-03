require 'fellowship'

RSpec.describe Fellowship do
  it "has a version number" do
    expect(Fellowship::VERSION).not_to be nil
  end

  it "finds the factorial of 5" do
    expect(Fellowship::Fellowship.factorial(5)).to eq(120)
  end

  it "finds the factorial of 0" do
    expect(Fellowship::Fellowship.factorial(0)).to eq(1)
  end

  it "deep copies 'hello'" do
    expect(Fellowship::Fellowship.deep_copy('hello')).to eq('hello')
  end

  it "determines whether 2 is prime" do
    expect(Fellowship::Fellowship.prime?(2)).to eq(true)
  end

  it "determines whether 3 is prime" do
    expect(Fellowship::Fellowship.prime?(3)).to eq(true)
  end

  it "determines whether 1 is prime" do
    expect(Fellowship::Fellowship.prime?(9)).to eq(false)
  end

  it "determines whether 1.0 is prime" do
    expect(Fellowship::Fellowship.prime?(1.0)).to eq(false)
  end

  it "determines whether 2.0 is prime" do
    expect(Fellowship::Fellowship.prime?(2.0)).to eq(true)
  end

  it "determines the second digit of 2345" do
    expect(Fellowship::Fellowship.int_digit(2345,1)).to eq(3)
  end

  it "sorts people by age and name" do
    people = [
      {:name=>"Donald", :age=>8},
      {:name=>"Angela", :age=>26},
      {:name=>"Jake", :age=>34},
      {:name=>"Brett", :age=>3},
      {:name=>"Sunny", :age=>4},
      {:name=>"Stacy", :age=>54},
      {:name=>"Amber", :age=>53},
      {:name=>"Adam", :age=>54},
      {:name=>"Apsara", :age=>100},
      {:name=>"Keith", :age=>3}
    ]
    sorted_people = [
      {:name=>"Brett", :age=>3},
      {:name=>"Keith", :age=>3},
      {:name=>"Sunny", :age=>4},
      {:name=>"Donald", :age=>8},
      {:name=>"Angela", :age=>26},
      {:name=>"Jake", :age=>34},
      {:name=>"Amber", :age=>53},
      {:name=>"Adam", :age=>54},
      {:name=>"Stacy", :age=>54},
      {:name=>"Apsara", :age=>100}
    ]
    expect(Fellowship::Fellowship.sort_hashes_by(people, :age, :name)).to eq(sorted_people)
  end
end
