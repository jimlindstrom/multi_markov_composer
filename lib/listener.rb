#!/usr/bin/env ruby

class Listener
  LOGGING = true

  def initialize
    @critics = []
  end

  def add_critic(c)
    @critics.push c
  end

  def listen(notes, logging=false)
    return if !analyze_note_queue(notes)

    @critics.each { |c| c.reset }
    cum_info_content = {}
    @critics.each { |c| cum_info_content[String(c.class)] = 0.0 }

    if logging
      str  = to_fixed_width("note")
      str += @critics.map { |c| to_fixed_width(String(c.class)) }.join
      puts str
    end

    notes.each do |n| 
      if logging     
        str = to_fixed_width("#{n.pitch.val}, #{n.duration.val}")
        @critics.each do |c| 
          info_content = c.information_content(n)
          cum_info_content[String(c.class)] += ( info_content || 0.0 )
          str += to_fixed_width(String(info_content))
        end
        puts str
      end
   
      @critics.each { |c| c.listen(n) }
    end

    if logging
      str  = to_fixed_width("total")
      str += @critics.map { |c| to_fixed_width(String(cum_info_content[String(c.class)])) }.join
      puts str
    end
  end

  private

  def to_fixed_width(str,str_len=6,pad_len=2)
    s = str[0..(str_len-1)]
    until (s.length == str_len) do
      s += " "
    end
    s += " "*pad_len
    return s
  end

  def analyze_note_queue(notes)
    if notes.detect_meter
      puts "\tmeter: #{notes.meter.inspect}" if LOGGING
    else
      puts "\tfailed to detect meter. ignoring stimulus." if LOGGING
      return false # FIXME: figure out a way to listen with only partial info (no meter)
    end
    notes.analyze!
    return true
  end

end
