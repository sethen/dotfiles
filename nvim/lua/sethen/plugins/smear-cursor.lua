-- make the cursor animate when moving
--
return {
   "sphamba/smear-cursor.nvim",
   opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5
   },
}
