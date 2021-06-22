defmodule SurfaceBootstrap.AriaBase do
  defmacro __using__(_) do
    quote do
      @doc """
      Aria disabled, is set to true automatically if component
      has 'disabled' prop and it is true.
      """
      prop aria_disabled, :boolean

      @doc """
      Aria label, automatically set to label, if prop exists.
      Explicitly set to nil if this behaviour is unwanted.
      """
      prop aria_label, :string

      @doc """
      Aria hidden, automatically set to true if 'inivisble'
      prop is set.
      """
      prop aria_hidden, :boolean

      defp set_aria_base_attrs(assigns) do
        Enum.reduce([:aria_disabled, :aria_label, :aria_hidden], Keyword.new(), fn
          :aria_disabled, acc ->
            Keyword.put(
              acc,
              :"aria-disabled",
              assigns.aria_disabled || Keyword.get(assigns, :disabled, nil)
            )

          :aria_label, acc ->
            Keyword.put(
              acc,
              :"aria-label",
              assigns.aria_label || Keyword.get(assigns, :label, nil)
            )

          :aria_hidden, acc ->
            Keyword.put(
              acc,
              :"aria-hidden",
              assigns.aria_hidden || Keyword.get(assigns, :invisible, nil)
            )
        end)
      end
    end
  end
end
