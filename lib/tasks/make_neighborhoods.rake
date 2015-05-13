namespace :make_neighborhoods do
  desc "makes albany park"
  task make_all: :environment do
    albanyPark = Neighborhood.create({
      name: "Albany Park",
      description: "The Albany Park neighborhood is one of the most ethnically diverse in the United States. It has one of highest percentages of foreign-born residents of neighborhoods in Chicago.",
      zipcode: 60625
      })
    albanyPark.save!

    andersonville = Neighborhood.create({
      name: "Andersonville",
      description: "Andersonville is a neighborhood in western Edgewater. Once a sleepy little village made up primarily of Swedish immigrants, the community is particularly known for its diversity, including a continued Swedish cultural presence led by the Swedish American Museum, the Swedish Bakery and other Swedish businesses.",
      zipcode: 60640
      })
    andersonville.save!

    wicker_park = Neighborhood.create({
      name: "Wicker Park",
      description: "The present day neighborhood is best known for its numerous commercial and entertainment establishments, and being a convenient place to live for downtown workers due to its proximity to public transportation and The Loop. Gentrification has made the area much more attractive to college-educated white-collar workers, although it faced considerable resistance from the working-class Puerto Rican community it displaced. Crime has decreased and many new homes have been built as well as older homes being restored. This has led to increased business activity, with many new bars, restaurants, and stores opening to serve these individuals. The neighborhood is known for hosting local art stores and independent businesses.",
      zipcode: 60622
      })
    wicker_park.save!

    logan_square = Neighborhood.create({
      name: "Logan Square",
      description: "The community area and neighborhood are named for General John A. Logan who served in the Civil War, and later in Congress. One of the most striking intersections in the city, the square itself is a large public green space (designed by architect William LeBaron Jenney, Landscape architect, Jens Jensen and others) formed as the grand northwest terminus of the Chicago Boulevard System and the junction of Kedzie and Logan Boulevards and Milwaukee Avenue, which was once known as 'Northwest Plank Road' and traces its origins back to a Native American trail, prior to 1830.",
      zipcode: 60647
      })
    logan_square.save!
  end
end
