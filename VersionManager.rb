#!/usr/bin/ruby 

class VersionManager
  def initialize(version = nil)
    @actions = []
    if !version.nil?
      strings = version.split('.')
      @major = Integer(strings[0])
      @minor = strings.size > 1 ? Integer(strings[1]) : 0
      @patch = strings.size > 2 ? Integer(strings[2]) : 0
      @patch = 1 if (@major + @minor + @patch).zero?
    else
      @major = 0
      @minor = 0
      @patch = 1
    end
  end

  def major!
    @actions.push([@major, @minor, @patch])
    @major += 1
    @minor = 0
    @patch = 0
  end

  def minor!
    @actions.push([@minor, @patch])
    @minor += 1
    @patch = 0
  end

  def patch!
    @actions.push([@patch])
    @patch += 1
  end

  def rollback!
    last_version = @actions.pop
    raise "It's first version" if last_version.nil?
    if last_version.size == 1
      @patch = last_version[0]
    elsif last_version.size == 2
      @patch = last_version[1]
      @minor = last_version[0]
    else
      @patch = last_version[2]
      @minor = last_version[1]
      @major = last_version[0]
    end
  end

  def release
    to_s
  end

  def to_s
    "#{@major}.#{@minor}.#{@patch}"
  end
end 


# Нужно реализовать класс VersionManager. Конструктор опционально должен принимать строку - версию.
# Допустимые варианты строки: “{major}” (“1”), “{major}.{minor}” (“1.1”), “{major}.{minor}.{patch}” (“1.1.1”).
# В варианте типа "1.1.1.1.1" оставить только первые три значения версии.
# Если часть версии - не целое число (напр. "а.4.е"), то генерировать ошибку.
# Если версия не указана, то значение по умолчанию - “0.0.1”.

# Тестовые варианты

# vm = VersionManager.new

# vm.major! # увеличивает мажорную версию, устанавливая минорную и патч в 0 (напр. “2.0.0”)
# vm.minor! # увеличивает минорную версию, устанавливая патч в 0 (напр. “2.1.0”)
# vm.patch! # увеличивает патч версию (напр. “2.1.1”)

# vm.rollback! # возвращается к прошлой версии, если это возможно, иначе выдать ошибку
# vm.release # возвращает текущую версию в формате “{major}.{minor}.{patch}”