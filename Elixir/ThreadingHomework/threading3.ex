defmodule HW.Primes do
  # Calculate the sum of prime numbers within a given range
  def range_sum({start, stop}) do
    start..stop
    |> Enum.filter(&prime_check/1)  # Filter the numbers within the range using prime_check function
    |> Enum.sum()  # Calculate the sum of the filtered prime numbers
  end

  # Check if a number is prime
  defp prime_check(1), do: false
  defp prime_check(2), do: true
  defp prime_check(n) when n > 2 do
    not Enum.any?(2..trunc(:math.sqrt(n)), &divisible_check(n, &1))
    # Check if there exists any number between 2 and the square root of n that divides n evenly
  end

  defp divisible_check(n, x) do
    rem(n, x) == 0
    # Check if n is divisible by x
  end

  # Divide the range into subranges for parallel processing
  def make_ranges(start, finish, cores) do
    range_size = div(finish - start + 1, cores)
    segments = Enum.map(0..(cores - 1), fn core_index ->
      first_element = start + core_index * range_size
      last_element = first_element + range_size - 1
      {first_element, last_element}
    end)
    segments
  end

  # Calculate the sum of prime numbers in parallel using multiple cores
  def sum_primes_parallel(start, finish, cores) do
    make_ranges(start, finish, cores)
    |> Enum.map(&Task.async(fn -> range_sum(&1) end))  # Run range_sum in parallel using Task.async
    |> Enum.map(&Task.await(&1, :infinity))  # Await the results of each task
    |> Enum.sum()  # Calculate the sum of the results
  end

  # Calculate the sum of prime numbers without parallel programming
  def sum_primes(start, stop) do
    {start, stop}
    |> range_sum()  # Call range_sum to calculate the sum of prime numbers
  end

end

start = 1
finish = 5000000

# Calculate the sum of prime numbers using 4 cores in parallel
{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 4)
end)
IO.puts("Tiempo de ejecucion con 4 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 3 cores in parallel
{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 3)
end)
IO.puts("Tiempo de ejecucion con 3 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 2 cores in parallel
{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 2)
end)
IO.puts("Tiempo de ejecucion con 2 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 5 cores in parallel
{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 5)
end)
IO.puts("Tiempo de ejecucion con 5 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 6 cores in parallel

{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 6)
end)
IO.puts("Tiempo de ejecucion con 6 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 7 cores in parallel

{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 7)
end)
IO.puts("Tiempo de ejecucion con 7 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using 8 cores in parallel

{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes_parallel(start, finish, 8)
end)
IO.puts("Tiempo de ejecucion con 8 cores: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")

# Calculate the sum of prime numbers using no parallel programming
{time, result} = :timer.tc(fn ->
  HW.Primes.sum_primes(start, finish)
end)
IO.puts("Tiempo de ejecucion sin programacion paralela es: #{time} microsegundos")
IO.puts("El resultado de la suma de todos los valores es: #{result}")
