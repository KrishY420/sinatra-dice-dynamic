describe "root URL" do
  it "has a level one heading with the text 'Dice Roll'", points: 1 do
    visit "/"

    expect(page).to have_tag("h1", text: /Dice\s+Roll/i)
  end
end

describe "root URL" do
  it "has links to '/dice/X/Y', where 'X' is the number of dice, and 'Y' is the number of sides", points: 1 do
    visit "/"

    expect(page).to have_tag("a", :with => { :href => "/dice/2/6" })
    expect(page).to have_tag("a", :with => { :href => "/dice/2/10" })
    expect(page).to have_tag("a", :with => { :href => "/dice/1/20" })
    expect(page).to have_tag("a", :with => { :href => "/dice/5/4" })
  end
end

describe "/dice/2/6" do
  it "has a level one heading with the text '2d6'", points: 1 do
    visit "/dice/2/6"

    expect(page).to have_tag("h1", text: /2d6/i)
  end
end

describe "/dice/2/6" do
  it "displays the outcome of rolling two six-sided dice in <li>'s of an unordered list", points: 1 do
    visit "/dice/2/6"

    expect(page).to have_tag("ul") do
      with_tag("li", :text => /\d+/, :count => 2)
    end
  end
end

describe "/dice/2/10" do
  it "has a level one heading with the text '2d10'", points: 1 do
    visit "/dice/2/10"

    expect(page).to have_tag("h1", text: /2d10/i)
  end
end

describe "/dice/2/10" do
  it "displays the outcome of rolling two six-sided dice in <li>'s of an unordered list", points: 1 do
    visit "/dice/2/10"

    expect(page).to have_tag("ul") do
      with_tag("li", :text => /\d+/, :count => 2)
    end
  end
end

describe "/dice/1/20" do
  it "has a level one heading with the text '1d20'", points: 1 do
    visit "/dice/1/20"

    expect(page).to have_tag("h1", text: /1d20/i)
  end
end

describe "/dice/1/20" do
  it "displays the outcome of rolling one 20-sided dice in <li>'s of an unordered list", points: 1 do
    visit "/dice/1/20"

    expect(page).to have_tag("ul") do
      with_tag("li", :text => /\d+/, :count => 1)
    end
  end
end

describe "/dice/5/4" do
  it "has a level one heading with the text '5d4'", points: 1 do
    visit "/dice/5/4"

    expect(page).to have_tag("h1", text: /5d4/i)
  end
end

describe "/dice/5/4" do
  it "displays the outcome of rolling one four-sided dice in <li>'s of an unordered list", points: 1 do
    visit "/dice/5/4"

    expect(page).to have_tag("ul") do
      with_tag("li", :text => /\d+/, :count => 5)
    end
  end
end

describe "/dice/50/6" do
  it "has a level one heading with the text '50d6'", points: 1 do
    visit "/dice/50/6"

    expect(page).to have_tag("h1", text: /50d6/i)
  end
end

describe "/dice/50/6" do
  it "displays the outcome of rolling 50 six-sided dice in <li>'s of an unordered list", points: 1 do
    visit "/dice/50/6"

    expect(page).to have_tag("ul") do
      with_tag("li", :text => /\d+/, :count => 50)
    end
  end
end
