def cake_slice(cake)

  skip_next_row = false
  count = 0
  slice_area = 0
  slice_area_arr = []
  slice = []
  cake_piece = []
  ccount = 0

  raisin_count = find_raisin(cake)

  puts "Raisin count: #{raisin_count}"

  cake.each_with_index do |row, index|
    if skip_next_row
      skip_next_row = false
      next
    end
      if row.include?('o')

        slice << row
        cake_piece[ccount] = row
        ccount += 1
        slice_area += row.count('.') + row.count('o')

        if slice_area_arr&.empty?

          if raisin_count == 2 && slice_area == 8
            slice << cake[index+1]
            slice_area += cake[index+1]&.count('.').to_i + cake[index+1]&.count('o').to_i
            slice_area_arr[count] = slice_area
            count += 1
            skip_next_row = true
            puts "#{slice}"
            slice.clear
            slice_area = 0
            else
              slice_area_arr[count] = slice_area
              count += 1
              slice_area = 0
              puts "#{slice}"
              slice.clear
          end

        elsif slice_area != slice_area_arr[0] && slice_area != 0
          slice << cake[index+1]
          slice_area += cake[index+1]&.count('.').to_i + cake[index+1]&.count('o').to_i
          slice_area_arr[count] = slice_area
          puts "#{slice}"
          slice.clear
        elsif slice_area == slice_area_arr[0] && slice_area != 0
          cake_piece[ccount] = row
          ccount += 1
          slice_area_arr[count] = slice_area
          count += 1
          slice_area = 0
          puts "#{slice}"
          slice.clear
        end
      else

        slice << row
        cake_piece[ccount] = row
        ccount += 1
        slice_area += row.count('.') + row.count('o')

      end
  end


  puts "1 slice area : #{slice_area_arr[0]}"
  puts "2 slice area : #{slice_area_arr[1]}"
  puts "3 slice area : #{slice_area_arr[2]}"
  puts "4 slice area : #{slice_area_arr[3]}"

end

def find_raisin(cake)
  raisin_count = 0
  row_raisin_count = 0

  cake.each do |row|
    if row.include?('o')
      raisin_count += row.count('o')
      row_raisin_count += row.count('o')
      if row_raisin_count > 1
        puts "Too much raisin for 1 row"
        exit(1)
      end
      row_raisin_count = 0
    end
  end

  raisin_count
end


cake = [
  '.......o',
  '..o.....',
  '......o.',
  'o.......'
]

cake_slice(cake)

